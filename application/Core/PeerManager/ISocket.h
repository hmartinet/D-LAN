#ifndef PEERMANAGER_ISOCKET_H
#define PEERMANAGER_ISOCKET_H

#include <QIODevice>

#include <google/protobuf/message.h>

namespace PM
{
   class ISocket : public QObject
   {
   public:
      virtual ~ISocket() {}

      virtual QIODevice* getDevice() = 0;
      virtual void send(quint32 type, const google::protobuf::Message& message) = 0;
      virtual void finished() = 0;
   };
}

#endif
