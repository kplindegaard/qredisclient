#pragma once
#include "command.h"
#include <QDebug>

namespace RedisClient {

class QREDISCLIENT_EXPORT ScanCommand : public Command
{
public:
    ScanCommand(const QList<QByteArray>& cmd, int db) : Command(cmd, db) {}
    ScanCommand(const QList<QByteArray>& cmd) : Command(cmd) {}    

    void setCursor(long long cursor);

    bool isValidScanCommand() const;

private:
    bool isKeyScanCommand(const QString& cmd) const;
    bool isValueScanCommand(const QString& cmd) const;
};

}
