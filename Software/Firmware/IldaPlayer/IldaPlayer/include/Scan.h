/*
	Scan.h
	Scan Engine for ILDA images

	Copyright 2020 Scrootch.me!

	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

	     http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.
*/

#ifndef SCAN_H
#define SCAN_H

#include "SDCard.h"

void scan_Init();

void scan_SetEnable(uint8_t enable);
void scan_SetCurrentFrame (SD_FRAME* newFrame);

#endif