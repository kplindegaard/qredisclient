#pragma once
#include <QByteArray>
#include <QString>
#include <QTextCodec>
#include <cctype>

QREDISCLIENT_EXPORT QString printableString(const QByteArray& raw, bool strictChecks = false);

QREDISCLIENT_EXPORT bool isBinary(const QByteArray& raw);

QREDISCLIENT_EXPORT QByteArray printableStringToBinary(const QString& str);
