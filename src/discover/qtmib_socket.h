/*
 * Copyright (C) 2013-2014 RCP100 Team (rcpteam@yahoo.com)
 *
 * This file is part of qtmib project
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
*/
#ifndef QTMIB_SOCKET_H
#define QTMIB_SOCKET_H

#ifdef __cplusplus
extern "C" {
#endif
#include <stdint.h>

int rx_open(uint16_t port);
uint32_t rx_packet(int sock);
void tx_packet(int sock, uint32_t ip, int port, int type, const char *community);

#ifdef __cplusplus
}
#endif

#endif