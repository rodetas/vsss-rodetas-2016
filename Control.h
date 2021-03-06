#ifndef CONTROL_H_
#define CONTROL_H_

#include "Header.h"
#include "Vision.h"
#include "GUI/Graphic.h"
#include "GUI/Menu.h"
#include "Calibration.h"
#include "Transmission.h"
#include "Strategy.h"
#include "utils/Fps.h"
#include "GUI/Simulator.h"
#include "GUI/Arduino.h"
#include "utils/Test.h"
#include "CRUD/Manipulation.h"

class Control{

private:
	Menu menu;
	Calibration calibration;
	Manipulation manipulation;
	Transmission transmission;
	Strategy strategy;
	Vision vision;
	Graphic graphic;
	Fps fps;
	Simulator simulator;
	Arduino arduino;
	Test test;


	bool program;
	bool game;

	vector<Object> objects;
	vector<string> movements;

public:
	Control();
	void setInformations();
	void handle();

};

#endif