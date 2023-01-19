#ifndef PBCCHAIN_QT_TEST_WALLETTESTS_H
#define PBCCHAIN_QT_TEST_WALLETTESTS_H

#include <QObject>
#include <QTest>

class WalletTests : public QObject
{
    Q_OBJECT

private Q_SLOTS:
    void walletTests();
};

#endif // PBCCHAIN_QT_TEST_WALLETTESTS_H
