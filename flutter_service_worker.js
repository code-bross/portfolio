'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.json": "b7c6c2f3f5115110335c1ca632cd9676",
"assets/AssetManifest.bin": "960b9bd7da87a0efbcf8793b11869cd7",
"assets/assets/sakun_2.png": "f38fea5aa0b4d3aac1140a15e90ea229",
"assets/assets/sakun_1.png": "c491abbd0c11fd0552550681eeac3703",
"assets/assets/sakun_3.png": "6c1601c9844b2c7ce4d65200eea654be",
"assets/assets/hi.gif": "cad5918d86b6a7e83f1fb4acead70e4c",
"assets/assets/resume/resume.pdf": "cb245fddc5e18213e5c49aa3177bae7d",
"assets/assets/projects/bg_kis.png": "e9f8f1939ea40da8f45d469f1852b446",
"assets/assets/projects/ikisi/ikisi_5.webp": "9e90f353ce278f849c521c6cdcade3f8",
"assets/assets/projects/ikisi/ikisi_7.webp": "798dd029132e72d16f49c45410bcc27c",
"assets/assets/projects/ikisi/ikisi_1.webp": "859b6a454fc93713be809548bcc7062a",
"assets/assets/projects/ikisi/ikisi_8.webp": "c2eff8dc3f8e8b1b76e0e9fc4db516c0",
"assets/assets/projects/ikisi/ikisi_4.webp": "d976729c21800485ac0367912a648837",
"assets/assets/projects/ikisi/ikisi_2.webp": "d283b87c5af466cd0011f4ecdea18ec6",
"assets/assets/projects/ikisi/ikisi_3.webp": "c4f4bc36348bd4d297388555fcda4a14",
"assets/assets/projects/ikisi/ikisi_6.webp": "93380fb01cbc0867202bb0be0f343da1",
"assets/assets/projects/java.png": "62be9fb6e1d7166e9cbeeed913096752",
"assets/assets/projects/alyacm/alyacm_3.png": "c0cee1333c0097a0475c1b546c177666",
"assets/assets/projects/alyacm/alyacm_8.png": "bdd5bc3547531a927011bd11359fe44f",
"assets/assets/projects/alyacm/alyacm_4.png": "6f286af892b57e799d25ce0b7e317f5d",
"assets/assets/projects/alyacm/alyacm_6.png": "7a9bd8ba670c4646d6834a3b201cdba8",
"assets/assets/projects/alyacm/alyacm_2.png": "19a3bf759edb1de26ce2e46a38aa1147",
"assets/assets/projects/alyacm/alyacm_1.png": "2d4e3bad8263f7da87cccac15c9db089",
"assets/assets/projects/alyacm/alyacm_7.png": "cc6fc67db6fbe61e9b3232bb8b328622",
"assets/assets/projects/alyacm/alyacm_5.png": "883f953ccd2f6d0806490238e81f2631",
"assets/assets/projects/logo_alyacm.png": "7623ed731de1547212cc22e80f932793",
"assets/assets/projects/logo_ikisi.webp": "11bf0e14b4122c635b9b080aa8a0f817",
"assets/assets/projects/kasa/bg_kasa_3.png": "d986089780b301b25ce36a3b10fdc740",
"assets/assets/projects/kasa/bg_kasa_4.png": "d49f4ac6baf3442422686bb40bf687bc",
"assets/assets/projects/kasa/bg_kasa_2.png": "5c035db102ad5ac15f5fd49187b7fe49",
"assets/assets/projects/kasa/bg_kasa_5.png": "75245ff64ab46b434c39235264185b7e",
"assets/assets/projects/kasa/bg_kasa_6.png": "e4789a1debfdf40ad0b4a7270ae16854",
"assets/assets/projects/kasa/bg_kasa_1.png": "c7db81e771e9fd5e5a1a36db94ad15d4",
"assets/assets/projects/bg_ikis.webp": "2a681b086980fdb0906c15c2e66fe7c9",
"assets/assets/projects/logo_kasa.png": "d312df986eae9f91fc0dacaae1da2dcc",
"assets/assets/projects/logo_kis.webp": "96aae5e14a49379a68592e6490ca9209",
"assets/assets/projects/ikis/ikis_5.webp": "0ae0a8718f82eaa53e9a2b42c761acc6",
"assets/assets/projects/ikis/ikis_3.webp": "2a681b086980fdb0906c15c2e66fe7c9",
"assets/assets/projects/ikis/ikis_2.webp": "b31a4f7aa0709034a7ebb41cb53a494d",
"assets/assets/projects/ikis/ikis_6.webp": "31a069e42dce338bf5fc90a77ea0c8fb",
"assets/assets/projects/ikis/ikis_1.webp": "2f046b618ce286b3a44f0315f24513e8",
"assets/assets/projects/ikis/ikis_4.webp": "a8badc9383ea4254afb2c7299baef835",
"assets/assets/projects/ikis/ikis_7.webp": "446b3138b20ab10746765e45b1f08d5b",
"assets/assets/projects/bg_kasa.jpeg": "78c3f4ab2c6fb8bee3a43e5f9567c5d4",
"assets/assets/projects/flutter.png": "0b5a2f8d3f4d173805affaf9f84f6c87",
"assets/assets/projects/kis/kis_7.webp": "44e0de9d9e7595828ea4099adf4b5458",
"assets/assets/projects/kis/kis_5.webp": "728110892c31be17540afd7ad765d601",
"assets/assets/projects/kis/kis_3.webp": "a96d9e0e004dd0679aab772b88ec3390",
"assets/assets/projects/kis/kis_2.webp": "423e49f0b4a1f44ff93c83bca775ab3f",
"assets/assets/projects/kis/kis_4.webp": "188d9d8cf588bdbfac5d05a7c93234ed",
"assets/assets/projects/kis/kis_6.webp": "f98df8501c7093a480b2412fbcb8a4a6",
"assets/assets/projects/kis/kis_1.webp": "c722884cec0e9d38a5d9191a86b7bb02",
"assets/assets/projects/bg_alyacm.png": "494e00a71a2840c34f53ad82eeb49630",
"assets/assets/projects/bg_ikisi.jpg": "e8b20bb2b1e411d38b9d40f7021a4ed8",
"assets/assets/projects/bg_ikis.jpg": "d584bcc49ca00fc1418beef333c33039",
"assets/assets/projects/logo_ikis.webp": "1804973b3b8dbea77ec50a69d5ac7169",
"assets/assets/projects/android.png": "765adf924dae4d5e67bfb640bcd05c48",
"assets/assets/projects/kotlin.png": "caa56a6dcf651f530447c713303587cf",
"assets/assets/services/github_action.png": "cd8681a630eb3f3233809ae785f3fb64",
"assets/assets/services/open.png": "4a5996597d32b06d91183f0860c29aab",
"assets/assets/services/api.png": "c9517908b2895ed93ca1632039783ae7",
"assets/assets/services/open_b.png": "b65517dd1a07922b014409bb8dcb1e81",
"assets/assets/services/rapid.png": "8d3ff9fbdddae77403af46662f011ee8",
"assets/assets/services/work.png": "63a12f6de87c9c0f49041200cdd028f1",
"assets/assets/services/ui.png": "3cf727247752b730a05f51fe0177036f",
"assets/assets/services/app.png": "9d2da88edb7f550ef24874b306b4ae12",
"assets/assets/services/blog.png": "5e1cbb2c67e2b8ea9ae4bcce0705d2a4",
"assets/assets/services/fiverr.png": "9d4018924e1f0e983a86e7eaf8a0958b",
"assets/assets/fonts/montserrat.ttf": "ee6539921d713482b8ccd4d0d23961bb",
"assets/assets/fonts/agustina.otf": "7b9833076716a8d14eec0cf885a3153c",
"assets/assets/dsc.png": "bd954ceeeb42b91899ebe1c3b0d79850",
"assets/FontManifest.json": "9bdb557c6b2f6cedd7a1dc0d926f5bd0",
"assets/fonts/MaterialIcons-Regular.otf": "24a4285984a8d01501d04f969ac344ee",
"assets/AssetManifest.bin.json": "c213dea2df0abcec8bf5527938274064",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/NOTICES": "0684fcd91e84c3bc14a64bd1d9f49e40",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "c6ac80bdc5b2896345377c9439f91d54",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "0ebc4e7ca5e040da671730a59b181135",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "2f141ffd94f3ef0ed716615fd537e708",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Typewriter-Regular.ttf": "87f56927f1ba726ce0591955c8b3b42d",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Main-BoldItalic.ttf": "e3c361ea8d1c215805439ce0941a1c8d",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Size2-Regular.ttf": "959972785387fe35f7d47dbfb0385bc4",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_SansSerif-Regular.ttf": "b5f967ed9e4933f1c3165a12fe3436df",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Caligraphic-Bold.ttf": "a9c8e437146ef63fcd6fae7cf65ca859",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Size1-Regular.ttf": "1e6a3368d660edc3a2fbbe72edfeaa85",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Size4-Regular.ttf": "85554307b465da7eb785fd3ce52ad282",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Size3-Regular.ttf": "e87212c26bb86c21eb028aba2ac53ec3",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Main-Bold.ttf": "9eef86c1f9efa78ab93d41a0551948f7",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Main-Regular.ttf": "5a5766c715ee765aa1398997643f1589",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Fraktur-Regular.ttf": "dede6f2c7dad4402fa205644391b3a94",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Main-Italic.ttf": "ac3b1882325add4f148f05db8cafd401",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Script-Regular.ttf": "55d2dcd4778875a53ff09320a85a5296",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Caligraphic-Regular.ttf": "7ec92adfa4fe03eb8e9bfb60813df1fa",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Fraktur-Bold.ttf": "46b41c4de7a936d099575185a94855c4",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_SansSerif-Italic.ttf": "d89b80e7bdd57d238eeaa80ed9a1013a",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_AMS-Regular.ttf": "657a5353a553777e270827bd1630e467",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_SansSerif-Bold.ttf": "ad0a28f28f736cf4c121bcb0e719b88a",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Math-Italic.ttf": "a7732ecb5840a15be39e1eda377bc21d",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Math-BoldItalic.ttf": "946a26954ab7fbd7ea78df07795a6cbc",
"assets/packages/wakelock_web/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "5f72d664707e4d711a1c0c240912cd50",
"manifest.json": "f80ab676bb6c80505966defb6b2b2bdc",
"version.json": "a29e8b22a08aa0274b027931eec216c4",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"index.html": "d66627e07f3f2ffddf9cca4ea152a826",
"/": "d66627e07f3f2ffddf9cca4ea152a826",
"flutter_bootstrap.js": "0e04a07c67e25db848c928d7360c55f4",
"icons/Icon-192.png": "002516a4b23f153b7ac2928347c377b1",
"icons/Icon-512.png": "84780d2dfe97536ad1b68213079cc78b",
"favicon.png": "61b493df9635f221d909421e8769acb0",
"main.dart.js": "75d079c4c3b98cf75cb42f76699d9ea0"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
