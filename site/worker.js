importScripts('/assets/2021/scripts/workbox/workbox-sw.js');
self.addEventListener("message",(event)=>{if(event.data&&event.data.type==="SKIP_WAITING")self.skipWaiting()});
const now=new Date(Date.now());
const refresh=Date.UTC(now.getUTCFullYear(),now.getUTCMonth(),now.getUTCDay()+1,03,11);
const retentionTime=refresh-now;
const bgSync=new workbox.backgroundSync.BackgroundSyncPlugin("bg-sync-queue", {maxRetentionTime: retentionTime.valueOf()})
workbox.routing.registerRoute(new RegExp(/^\/(?!tools\/share-toot).*/),new workbox.strategies.StaleWhileRevalidate({cacheName:"offline-cache"}))
