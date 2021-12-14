#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include "../../Qtraspberrylib/mcp23017.h"

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

private:
    void setupPins();
    void setupExtender();

private slots:
    void on_pushButton_clicked();

    void on_pushButton_2_clicked();

    void on_pushButton_3_clicked();

    void on_pushButton_open_i2c2_clicked();

    void on_pushButton_write_i2c2_clicked();

    void on_pushButton_read_i2c2_clicked();

private:
    Ui::MainWindow *ui;

    int state;

    Mcp23017 myexp;

    int fd;

};

#endif // MAINWINDOW_H
