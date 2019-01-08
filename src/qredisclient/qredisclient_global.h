#include <QtCore/QtGlobal>

#if defined(QREDISCLIENT_SHARED)
#  define QREDISCLIENT_EXPORT Q_DECL_EXPORT
#else
#  define QREDISCLIENT_EXPORT Q_DECL_IMPORT
#endif
