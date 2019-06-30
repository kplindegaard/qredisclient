#include <QCoreApplication>
#include <QTest>

// tests
#include <iostream>
#include "qredisclient/redisclient.h"
#include "test_command.h"
#include "test_config.h"
#include "test_connection.h"
#include "test_response.h"
#include "test_responseparer.h"
#include "test_text.h"
#include "test_transporters.h"


QStringList& incOutfile(QStringList& args, const QString& pattern)
{
  static int number = 1;
  if (args.contains("-o"))
  {
    QString rePattern = QString::fromUtf8("\\d?\\") + pattern;
    QRegularExpression re = QRegularExpression(rePattern);
    QString after = QString::number(number++) + pattern;
    return args.replaceInStrings(re, after);
  }
  return args;
}

int main(int argc, char *argv[]) {
  QCoreApplication app(argc, argv);

  initRedisClient();

  QScopedPointer<QObject> testCommand(new TestCommand);
  QScopedPointer<QObject> testResponse(new TestResponse);
  QScopedPointer<QObject> testResponseParser(new TestResponseParser);
  QScopedPointer<QObject> testConfig(new TestConfig);
  QScopedPointer<QObject> testText(new TestText);
  QScopedPointer<QObject> testTransporters(new TestTransporters);
  QScopedPointer<QObject> testConnection(new TestConnection);

  QStringList args = app.arguments();
  QString pattern = QString::fromUtf8(".xml");

  int allTestsResult = 0 + QTest::qExec(testCommand.data(), incOutfile(args, pattern)) +
                       QTest::qExec(testResponseParser.data(), incOutfile(args, pattern)) +
                       QTest::qExec(testResponse.data(), incOutfile(args, pattern)) +
                       QTest::qExec(testConfig.data(), incOutfile(args, pattern)) +
                       QTest::qExec(testText.data(), incOutfile(args, pattern)) +
                       QTest::qExec(testTransporters.data(), incOutfile(args, pattern)) +
                       QTest::qExec(testConnection.data(), incOutfile(args, pattern));

  if (allTestsResult == 0)
    qDebug() << "[Tests PASS]";
  else
    qDebug() << "[Tests FAIL]";

  return (allTestsResult != 0) ? 1 : 0;
}
