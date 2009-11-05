#ifndef FILEMANAGER_EXCEPTIONS_H
#define FILEMANAGER_EXCEPTIONS_H

#include <exception>
using namespace std;

#include <QStringList>

namespace FM
{
   class FileSystemEntriesNotFoundException : public exception
   {
   public :
      FileSystemEntriesNotFoundException(const QStringList& paths) : paths(paths) {}
      virtual ~FileSystemEntriesNotFoundException() throw () {}
      QStringList getPaths() const { return this->paths; }

   private :
      QStringList paths;
   };

   class FilesNotFoundException : public FileSystemEntriesNotFoundException
   {
   public :
      FilesNotFoundException(const QStringList& paths) : FileSystemEntriesNotFoundException(paths) {}
      virtual ~FilesNotFoundException() throw () {}
   };

   class DirsNotFoundException : public FileSystemEntriesNotFoundException
   {
   public :
      DirsNotFoundException(const QStringList& paths) : FileSystemEntriesNotFoundException(paths) {}
      virtual ~DirsNotFoundException() throw () {}
   };

   class SuperDirectoryExistsException : public exception
   {
   public:
      virtual ~SuperDirectoryExistsException() throw() {}
   };

   // TODO : add some additionnals informations
   class SubDirectoriesWithDifferentRightsExistsException : public exception
   {
   public:
      virtual ~SubDirectoriesWithDifferentRightsExistsException() throw() {}
   };
}

#endif
