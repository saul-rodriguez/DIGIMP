#ifndef EXPANDERTEST_H
#define EXPANDERTEST_H

#include "../../Qtraspberrylib/mcp23017.h"

#include <QObject>

class ExpanderTest : public Mcp23017
{
    Q_OBJECT
public:
    explicit ExpanderTest(QObject *parent = 0);

signals:

public slots:

};

#endif // EXPANDERTEST_H
