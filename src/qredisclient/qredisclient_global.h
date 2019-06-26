#include <QtCore/QtGlobal>

#if defined(QREDISCLIENT_SHARED)
#  if defined(QREDISCLIENT_BUILD)
#    define QREDISCLIENT_EXPORT Q_DECL_EXPORT
#  else
#    define QREDISCLIENT_EXPORT Q_DECL_IMPORT
#  endif
#else
#  define QREDISCLIENT_EXPORT
#endif
