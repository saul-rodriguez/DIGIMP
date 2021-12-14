#include "mainwindow.h"
#include "ui_mainwindow.h"

#include <wiringPi.h>
#include <wiringPiI2C.h>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    setupPins();
    //setupExtender();

    state = 0;

    ui->lineEdit1->setText("Welcome");

}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_pushButton_clicked()
{
    if(state) {
        state = 0;
        digitalWrite(17, LOW);

    } else {
        state = 1;
        digitalWrite(17, HIGH);
    }
}

void MainWindow::setupPins()
{

    //PIN GPIO.0 as output
    system("gpio mode 0 out"); //mode uses WiringPi pin notation
    system("gpio export 17 out"); //export uses BCM pin notation

    //Call WiringPi initialization
    wiringPiSetupSys();

}

void MainWindow::setupExtender()
{
    int ret;

    ret = myexp.open(0x20);

}

void MainWindow::on_pushButton_2_clicked()
{
    int ret;

    ret = myexp.open(0x20);

    QString str;
    str.setNum(ret);
    ui->lineEdit1->setText(str);

    myexp.setTris(PORTA,0xff);
    myexp.setTris(PORTB,0xfe);
    myexp.setPullup(PORTA,0xff);
    myexp.setPullup(PORTB,0xff);

}

void MainWindow::on_pushButton_3_clicked()
{
    if(state) {
        state = 0;
        myexp.writePin(PORTB,0,0);
    } else {
        state = 1;
        myexp.writePin(PORTB,0,1);
    }
}

void MainWindow::on_pushButton_open_i2c2_clicked()
{


    //ret = myexp.open(0x55);
    fd = wiringPiI2CSetup(0x55);

    QString str;
    str.setNum(fd);
    ui->lineEdit1->setText(str);
}

void MainWindow::on_pushButton_write_i2c2_clicked()
{
    quint8 address, value;

    int ret;
    QString aux;

    aux = ui->lineEditReg->text();
    address = (quint8)aux.toUInt();

    aux = ui->lineEditVal->text();
    value = (quint8)aux.toUInt();

    ret = wiringPiI2CWriteReg8(fd,address,value);
    QString str;
    str.setNum(ret);
    ui->lineEdit1->setText(str);
}

void MainWindow::on_pushButton_read_i2c2_clicked()
{

    quint8 address, value;

    int ret;
    QString aux;

    aux = ui->lineEditReg2->text();
    address = (quint8)aux.toUInt();


    ret = wiringPiI2CReadReg8(fd,address);

    QString str;
    str.setNum(ret);
    //ui->lineEdit1->setText(str);
    ui->lineEditVal2->setText(str);

}
