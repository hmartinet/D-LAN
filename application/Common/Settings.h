#ifndef COMMON_SETTINGS_H
#define COMMON_SETTINGS_H

#include <QString>
#include <QMutex>

#include <google/protobuf/descriptor.h>

#include <Protos/common.pb.h>

#include <Common/Hash.h>

#define SETTINGS Common::Settings::getInstance() // Don't do this at home, kids!

namespace Common
{
   class Settings
   {
      static const QString FILENAME; ///< The name of the file cache saved in the home directory.
      static Settings* instance;

   public:
      static Settings& getInstance();

      Settings();

      bool arePersisted();
      void save();
      void load();
      void remove();

      void set(const QString& name, quint32 value);
      void set(const QString& name, const QString& value);
      void set(const QString& name, const Hash& hash);

      void get(const QString& name, quint32& value);
      void get(const QString& name, QString& value);
      void get(const QString& name, Hash& hash);

      quint32 getUInt32(const QString& name);
      QString getString(const QString& name);
      Hash getHash(const QString& name);

   private:
      static void printErrorNameNotFound(const QString& name);
      static void printErrorBadType(const QString& fieldName, const QString& excepted);

      bool persisted;
      Protos::Common::Settings settings;
      QMutex mutex;

      const google::protobuf::Descriptor* descriptor;
   };
}

#endif