#ifndef DOWNLOADMANAGER_DOWNLOAD_H
#define DOWNLOADMANAGER_DOWNLOAD_H

#include <IDownload.h>

namespace PeerManager { class IPeer; }

namespace DownloadManager
{
   class Download : public IDownload
   {
   public:
      virtual quint32 getId();
      virtual Status getStatus();
      virtual bool isDir();
      virtual quint32 getProgress();
   protected:
      PeerManager::IPeer* peer;
   };
}
#endif