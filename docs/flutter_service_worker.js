'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "c420e205d8eac4ccea99913b4a50bfa7",
"index.html": "ddf3392b4163a3bd8c19ccd57d46b14a",
"/": "ddf3392b4163a3bd8c19ccd57d46b14a",
"main.dart.js": "fd223647f55caceb51bc6258d093f3c2",
"flutter.js": "1cfe996e845b3a8a33f57607e8b09ee4",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"favicon-96x96.png": "a4601e4fed70c2d6fbe3ea52f6a1c57e",
"icons/favicon-16x16.png": "03b2afc284d071bd5c272135c5550a1a",
"icons/favicon.ico": "ae1aab5be2bb68352b4f503bbbb56966",
"icons/apple-icon.png": "ec8f0a79c618cd1b79e54b3dd37d6c98",
"icons/apple-icon-144x144.png": "49acfba1865ba05ec9290432bbbb2913",
"icons/android-icon-192x192.png": "9ee6b13f21f8c8f6e26cc1d74aeb2f5b",
"icons/apple-icon-precomposed.png": "ec8f0a79c618cd1b79e54b3dd37d6c98",
"icons/apple-icon-114x114.png": "0930f25deb9a7498f9a2d5fbd2865c4c",
"icons/ms-icon-310x310.png": "c94c9a9351687177399bf22d59a9a2f8",
"icons/ms-icon-144x144.png": "49acfba1865ba05ec9290432bbbb2913",
"icons/apple-icon-57x57.png": "045b1ee065e06e81d389f6e0528abe34",
"icons/apple-icon-152x152.png": "f0f92d56cebd74a17b4892a7bde4d549",
"icons/ms-icon-150x150.png": "6a567f6ee63c134084656154c68f85eb",
"icons/android-icon-72x72.png": "102c515cd03243d95e1c7b1e95d520aa",
"icons/android-icon-96x96.png": "a4601e4fed70c2d6fbe3ea52f6a1c57e",
"icons/android-icon-36x36.png": "313d17bf8bcacde29d50bf8b5480c933",
"icons/apple-icon-180x180.png": "ec4fb509add2c19d0c248909d2e66618",
"icons/favicon-96x96.png": "a4601e4fed70c2d6fbe3ea52f6a1c57e",
"icons/manifest.json": "b58fcfa7628c9205cb11a1b2c3e8f99a",
"icons/android-icon-48x48.png": "5c7efce6d88e4b45fbe4bae5363e3c34",
"icons/apple-icon-76x76.png": "24cd489efff42b84b35e5e8443f2f8e2",
"icons/apple-icon-60x60.png": "b7ea0aaad65db0d3baabfb6e15ee74c0",
"icons/browserconfig.xml": "653d077300a12f09a69caeea7a8947f8",
"icons/android-icon-144x144.png": "49acfba1865ba05ec9290432bbbb2913",
"icons/apple-icon-72x72.png": "102c515cd03243d95e1c7b1e95d520aa",
"icons/apple-icon-120x120.png": "6ceed995c63989338a1871efb80a68be",
"icons/favicon-32x32.png": "082a71e7eff4de6032af4dd648309631",
"icons/ms-icon-70x70.png": "d419a10dfffe27195b10d4224dae8b78",
"manifest.json": "5b248b3e735dc8801283766a2d545bf9",
"assets/AssetManifest.json": "6158591bb4cbc868efbe1b22b14f0453",
"assets/NOTICES": "d8256cd8abd6183da78dfeb21c0180a4",
"assets/FontManifest.json": "90b1a3a546c00bd760b64f3df485d3da",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/assets/images/fnerd.json": "83f41c2a1b1cfbf625356adcb785babe",
"assets/assets/fonts/abo.ttf": "cb4c7aaa6ca3d17c6a103c709538397e",
"assets/assets/fonts/open-sans.ttf": "22ab03a6b890f2f142a137a38bf1d4ae",
"assets/assets/fonts/dosis.ttf": "ab3a88e71388b9f40eeacad1d7ca4097",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
