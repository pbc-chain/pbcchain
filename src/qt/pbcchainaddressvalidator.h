// Copyright (c) 2011-2014 The Pbcchain Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef PBCCHAIN_QT_PBCCHAINADDRESSVALIDATOR_H
#define PBCCHAIN_QT_PBCCHAINADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class PbcchainAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit PbcchainAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Pbcchain address widget validator, checks for a valid pbcchain address.
 */
class PbcchainAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit PbcchainAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // PBCCHAIN_QT_PBCCHAINADDRESSVALIDATOR_H
