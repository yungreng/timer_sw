avr-objdump -d main.elf

main.elf：     文件格式 elf32-avr


Disassembly of section .text:

00000000 <__vectors>:
   0:	53 c0       	rjmp	.+166    	; 0xa8 <__ctors_end>
   2:	ea c1       	rjmp	.+980    	; 0x3d8 <__vector_1>
   4:	6c c0       	rjmp	.+216    	; 0xde <__bad_interrupt>
   6:	6b c0       	rjmp	.+214    	; 0xde <__bad_interrupt>
   8:	6a c0       	rjmp	.+212    	; 0xde <__bad_interrupt>
   a:	69 c0       	rjmp	.+210    	; 0xde <__bad_interrupt>
   c:	68 c0       	rjmp	.+208    	; 0xde <__bad_interrupt>
   e:	67 c0       	rjmp	.+206    	; 0xde <__bad_interrupt>
  10:	66 c0       	rjmp	.+204    	; 0xde <__bad_interrupt>
  12:	eb c4       	rjmp	.+2518   	; 0x9ea <__vector_9>
  14:	64 c0       	rjmp	.+200    	; 0xde <__bad_interrupt>
  16:	63 c0       	rjmp	.+198    	; 0xde <__bad_interrupt>
  18:	62 c0       	rjmp	.+196    	; 0xde <__bad_interrupt>
  1a:	61 c0       	rjmp	.+194    	; 0xde <__bad_interrupt>
  1c:	60 c0       	rjmp	.+192    	; 0xde <__bad_interrupt>
  1e:	5f c0       	rjmp	.+190    	; 0xde <__bad_interrupt>
  20:	5e c0       	rjmp	.+188    	; 0xde <__bad_interrupt>
  22:	5d c0       	rjmp	.+186    	; 0xde <__bad_interrupt>
  24:	5c c0       	rjmp	.+184    	; 0xde <__bad_interrupt>
  26:	5b c0       	rjmp	.+182    	; 0xde <__bad_interrupt>
  28:	5a c0       	rjmp	.+180    	; 0xde <__bad_interrupt>
  2a:	59 c0       	rjmp	.+178    	; 0xde <__bad_interrupt>
  2c:	58 c0       	rjmp	.+176    	; 0xde <__bad_interrupt>
  2e:	57 c0       	rjmp	.+174    	; 0xde <__bad_interrupt>
  30:	56 c0       	rjmp	.+172    	; 0xde <__bad_interrupt>
  32:	55 c0       	rjmp	.+170    	; 0xde <__bad_interrupt>

00000034 <__trampolines_end>:
  34:	09 02       	muls	r16, r25
  36:	22 00       	.word	0x0022	; ????
  38:	01 01       	movw	r0, r2
  3a:	00 80       	ld	r0, Z
  3c:	0a 09       	sbc	r16, r10
  3e:	04 00       	.word	0x0004	; ????
  40:	00 01       	movw	r0, r0
  42:	03 00       	.word	0x0003	; ????
  44:	00 00       	nop
  46:	09 21       	and	r16, r9
  48:	01 01       	movw	r0, r2
  4a:	00 01       	movw	r0, r0
  4c:	22 16       	cp	r2, r18
  4e:	00 07       	cpc	r16, r16
  50:	05 81       	ldd	r16, Z+5	; 0x05
  52:	03 08       	sbc	r0, r3
  54:	00 64       	ori	r16, 0x40	; 64

00000056 <usbDescriptorDevice>:
  56:	12 01 10 01 00 00 00 08 c0 16 df 05 00 01 01 02     ................
  66:	00 01                                               ..

00000068 <usbDescriptorStringDevice>:
  68:	14 03 44 00 61 00 74 00 61 00 53 00 74 00 6f 00     ..D.a.t.a.S.t.o.
  78:	72 00 65 00                                         r.e.

0000007c <usbDescriptorStringVendor>:
  7c:	12 03 6f 00 62 00 64 00 65 00 76 00 2e 00 61 00     ..o.b.d.e.v...a.
  8c:	74 00                                               t.

0000008e <usbDescriptorString0>:
  8e:	04 03 09 04                                         ....

00000092 <usbDescriptorHidReport>:
  92:	06 00 ff 09 01 a1 01 15 00 26 ff 00 75 08 95 80     .........&..u...
  a2:	09 00 b2 02 01 c0                                   ......

000000a8 <__ctors_end>:
  a8:	11 24       	eor	r1, r1
  aa:	1f be       	out	0x3f, r1	; 63
  ac:	cf ef       	ldi	r28, 0xFF	; 255
  ae:	d2 e0       	ldi	r29, 0x02	; 2
  b0:	de bf       	out	0x3e, r29	; 62
  b2:	cd bf       	out	0x3d, r28	; 61

000000b4 <__do_copy_data>:
  b4:	11 e0       	ldi	r17, 0x01	; 1
  b6:	a0 e0       	ldi	r26, 0x00	; 0
  b8:	b1 e0       	ldi	r27, 0x01	; 1
  ba:	e4 ef       	ldi	r30, 0xF4	; 244
  bc:	fd e0       	ldi	r31, 0x0D	; 13
  be:	02 c0       	rjmp	.+4      	; 0xc4 <__do_copy_data+0x10>
  c0:	05 90       	lpm	r0, Z+
  c2:	0d 92       	st	X+, r0
  c4:	a4 31       	cpi	r26, 0x14	; 20
  c6:	b1 07       	cpc	r27, r17
  c8:	d9 f7       	brne	.-10     	; 0xc0 <__do_copy_data+0xc>

000000ca <__do_clear_bss>:
  ca:	21 e0       	ldi	r18, 0x01	; 1
  cc:	a4 e1       	ldi	r26, 0x14	; 20
  ce:	b1 e0       	ldi	r27, 0x01	; 1
  d0:	01 c0       	rjmp	.+2      	; 0xd4 <.do_clear_bss_start>

000000d2 <.do_clear_bss_loop>:
  d2:	1d 92       	st	X+, r1

000000d4 <.do_clear_bss_start>:
  d4:	af 36       	cpi	r26, 0x6F	; 111
  d6:	b2 07       	cpc	r27, r18
  d8:	e1 f7       	brne	.-8      	; 0xd2 <.do_clear_bss_loop>
  da:	1f d5       	rcall	.+2622   	; 0xb1a <main>
  dc:	89 c6       	rjmp	.+3346   	; 0xdf0 <_exit>

000000de <__bad_interrupt>:
  de:	90 cf       	rjmp	.-224    	; 0x0 <__vectors>

000000e0 <usbSetInterrupt>:
  e0:	cf 93       	push	r28
  e2:	c6 2f       	mov	r28, r22
  e4:	20 91 3f 01 	lds	r18, 0x013F
  e8:	24 ff       	sbrs	r18, 4
  ea:	07 c0       	rjmp	.+14     	; 0xfa <usbSetInterrupt+0x1a>
  ec:	20 91 40 01 	lds	r18, 0x0140
  f0:	38 e8       	ldi	r19, 0x88	; 136
  f2:	23 27       	eor	r18, r19
  f4:	20 93 40 01 	sts	0x0140, r18
  f8:	03 c0       	rjmp	.+6      	; 0x100 <usbSetInterrupt+0x20>
  fa:	2a e5       	ldi	r18, 0x5A	; 90
  fc:	20 93 3f 01 	sts	0x013F, r18
 100:	dc 01       	movw	r26, r24
 102:	e1 e4       	ldi	r30, 0x41	; 65
 104:	f1 e0       	ldi	r31, 0x01	; 1
 106:	9c 2f       	mov	r25, r28
 108:	9e 0f       	add	r25, r30
 10a:	8d 91       	ld	r24, X+
 10c:	81 93       	st	Z+, r24
 10e:	89 2f       	mov	r24, r25
 110:	8e 1b       	sub	r24, r30
 112:	18 16       	cp	r1, r24
 114:	d4 f3       	brlt	.-12     	; 0x10a <usbSetInterrupt+0x2a>
 116:	6c 2f       	mov	r22, r28
 118:	81 e4       	ldi	r24, 0x41	; 65
 11a:	91 e0       	ldi	r25, 0x01	; 1
 11c:	59 d1       	rcall	.+690    	; 0x3d0 <usbCrc16Append>
 11e:	cc 5f       	subi	r28, 0xFC	; 252
 120:	c0 93 3f 01 	sts	0x013F, r28
 124:	cf 91       	pop	r28
 126:	08 95       	ret

00000128 <usbPoll>:
 128:	cf 93       	push	r28
 12a:	df 93       	push	r29
 12c:	60 91 50 01 	lds	r22, 0x0150
 130:	63 50       	subi	r22, 0x03	; 3
 132:	67 fd       	sbrc	r22, 7
 134:	be c0       	rjmp	.+380    	; 0x2b2 <usbPoll+0x18a>
 136:	80 91 4d 01 	lds	r24, 0x014D
 13a:	cc e0       	ldi	r28, 0x0C	; 12
 13c:	d0 e0       	ldi	r29, 0x00	; 0
 13e:	c8 1b       	sub	r28, r24
 140:	d1 09       	sbc	r29, r1
 142:	cc 5a       	subi	r28, 0xAC	; 172
 144:	de 4f       	sbci	r29, 0xFE	; 254
 146:	80 91 4c 01 	lds	r24, 0x014C
 14a:	8d 32       	cpi	r24, 0x2D	; 45
 14c:	09 f0       	breq	.+2      	; 0x150 <usbPoll+0x28>
 14e:	a0 c0       	rjmp	.+320    	; 0x290 <usbPoll+0x168>
 150:	68 30       	cpi	r22, 0x08	; 8
 152:	09 f0       	breq	.+2      	; 0x156 <usbPoll+0x2e>
 154:	ac c0       	rjmp	.+344    	; 0x2ae <usbPoll+0x186>
 156:	83 ec       	ldi	r24, 0xC3	; 195
 158:	80 93 34 01 	sts	0x0134, r24
 15c:	8a e5       	ldi	r24, 0x5A	; 90
 15e:	80 93 01 01 	sts	0x0101, r24
 162:	10 92 14 01 	sts	0x0114, r1
 166:	88 81       	ld	r24, Y
 168:	80 76       	andi	r24, 0x60	; 96
 16a:	31 f0       	breq	.+12     	; 0x178 <usbPoll+0x50>
 16c:	ce 01       	movw	r24, r28
 16e:	ae d2       	rcall	.+1372   	; 0x6cc <usbFunctionSetup>
 170:	8f 3f       	cpi	r24, 0xFF	; 255
 172:	09 f4       	brne	.+2      	; 0x176 <usbPoll+0x4e>
 174:	7c c0       	rjmp	.+248    	; 0x26e <usbPoll+0x146>
 176:	82 c0       	rjmp	.+260    	; 0x27c <usbPoll+0x154>
 178:	9a 81       	ldd	r25, Y+2	; 0x02
 17a:	10 92 3d 01 	sts	0x013D, r1
 17e:	89 81       	ldd	r24, Y+1	; 0x01
 180:	81 11       	cpse	r24, r1
 182:	06 c0       	rjmp	.+12     	; 0x190 <usbPoll+0x68>
 184:	10 92 3e 01 	sts	0x013E, r1
 188:	2d e3       	ldi	r18, 0x3D	; 61
 18a:	31 e0       	ldi	r19, 0x01	; 1
 18c:	82 e0       	ldi	r24, 0x02	; 2
 18e:	6a c0       	rjmp	.+212    	; 0x264 <usbPoll+0x13c>
 190:	85 30       	cpi	r24, 0x05	; 5
 192:	19 f4       	brne	.+6      	; 0x19a <usbPoll+0x72>
 194:	90 93 51 01 	sts	0x0151, r25
 198:	62 c0       	rjmp	.+196    	; 0x25e <usbPoll+0x136>
 19a:	86 30       	cpi	r24, 0x06	; 6
 19c:	09 f0       	breq	.+2      	; 0x1a0 <usbPoll+0x78>
 19e:	49 c0       	rjmp	.+146    	; 0x232 <usbPoll+0x10a>
 1a0:	8b 81       	ldd	r24, Y+3	; 0x03
 1a2:	81 30       	cpi	r24, 0x01	; 1
 1a4:	19 f4       	brne	.+6      	; 0x1ac <usbPoll+0x84>
 1a6:	86 e5       	ldi	r24, 0x56	; 86
 1a8:	90 e0       	ldi	r25, 0x00	; 0
 1aa:	1a c0       	rjmp	.+52     	; 0x1e0 <usbPoll+0xb8>
 1ac:	82 30       	cpi	r24, 0x02	; 2
 1ae:	41 f4       	brne	.+16     	; 0x1c0 <usbPoll+0x98>
 1b0:	84 e3       	ldi	r24, 0x34	; 52
 1b2:	90 e0       	ldi	r25, 0x00	; 0
 1b4:	90 93 4f 01 	sts	0x014F, r25
 1b8:	80 93 4e 01 	sts	0x014E, r24
 1bc:	82 e2       	ldi	r24, 0x22	; 34
 1be:	35 c0       	rjmp	.+106    	; 0x22a <usbPoll+0x102>
 1c0:	83 30       	cpi	r24, 0x03	; 3
 1c2:	f1 f4       	brne	.+60     	; 0x200 <usbPoll+0xd8>
 1c4:	91 11       	cpse	r25, r1
 1c6:	08 c0       	rjmp	.+16     	; 0x1d8 <usbPoll+0xb0>
 1c8:	8e e8       	ldi	r24, 0x8E	; 142
 1ca:	90 e0       	ldi	r25, 0x00	; 0
 1cc:	90 93 4f 01 	sts	0x014F, r25
 1d0:	80 93 4e 01 	sts	0x014E, r24
 1d4:	84 e0       	ldi	r24, 0x04	; 4
 1d6:	29 c0       	rjmp	.+82     	; 0x22a <usbPoll+0x102>
 1d8:	91 30       	cpi	r25, 0x01	; 1
 1da:	41 f4       	brne	.+16     	; 0x1ec <usbPoll+0xc4>
 1dc:	8c e7       	ldi	r24, 0x7C	; 124
 1de:	90 e0       	ldi	r25, 0x00	; 0
 1e0:	90 93 4f 01 	sts	0x014F, r25
 1e4:	80 93 4e 01 	sts	0x014E, r24
 1e8:	82 e1       	ldi	r24, 0x12	; 18
 1ea:	1f c0       	rjmp	.+62     	; 0x22a <usbPoll+0x102>
 1ec:	92 30       	cpi	r25, 0x02	; 2
 1ee:	e1 f4       	brne	.+56     	; 0x228 <usbPoll+0x100>
 1f0:	88 e6       	ldi	r24, 0x68	; 104
 1f2:	90 e0       	ldi	r25, 0x00	; 0
 1f4:	90 93 4f 01 	sts	0x014F, r25
 1f8:	80 93 4e 01 	sts	0x014E, r24
 1fc:	84 e1       	ldi	r24, 0x14	; 20
 1fe:	15 c0       	rjmp	.+42     	; 0x22a <usbPoll+0x102>
 200:	81 32       	cpi	r24, 0x21	; 33
 202:	41 f4       	brne	.+16     	; 0x214 <usbPoll+0xec>
 204:	86 e4       	ldi	r24, 0x46	; 70
 206:	90 e0       	ldi	r25, 0x00	; 0
 208:	90 93 4f 01 	sts	0x014F, r25
 20c:	80 93 4e 01 	sts	0x014E, r24
 210:	89 e0       	ldi	r24, 0x09	; 9
 212:	0b c0       	rjmp	.+22     	; 0x22a <usbPoll+0x102>
 214:	82 32       	cpi	r24, 0x22	; 34
 216:	41 f4       	brne	.+16     	; 0x228 <usbPoll+0x100>
 218:	82 e9       	ldi	r24, 0x92	; 146
 21a:	90 e0       	ldi	r25, 0x00	; 0
 21c:	90 93 4f 01 	sts	0x014F, r25
 220:	80 93 4e 01 	sts	0x014E, r24
 224:	86 e1       	ldi	r24, 0x16	; 22
 226:	01 c0       	rjmp	.+2      	; 0x22a <usbPoll+0x102>
 228:	80 e0       	ldi	r24, 0x00	; 0
 22a:	90 e4       	ldi	r25, 0x40	; 64
 22c:	90 93 14 01 	sts	0x0114, r25
 230:	25 c0       	rjmp	.+74     	; 0x27c <usbPoll+0x154>
 232:	88 30       	cpi	r24, 0x08	; 8
 234:	69 f0       	breq	.+26     	; 0x250 <usbPoll+0x128>
 236:	89 30       	cpi	r24, 0x09	; 9
 238:	19 f4       	brne	.+6      	; 0x240 <usbPoll+0x118>
 23a:	90 93 53 01 	sts	0x0153, r25
 23e:	0f c0       	rjmp	.+30     	; 0x25e <usbPoll+0x136>
 240:	8a 30       	cpi	r24, 0x0A	; 10
 242:	49 f0       	breq	.+18     	; 0x256 <usbPoll+0x12e>
 244:	8b 30       	cpi	r24, 0x0B	; 11
 246:	59 f4       	brne	.+22     	; 0x25e <usbPoll+0x136>
 248:	8b e4       	ldi	r24, 0x4B	; 75
 24a:	80 93 40 01 	sts	0x0140, r24
 24e:	07 c0       	rjmp	.+14     	; 0x25e <usbPoll+0x136>
 250:	23 e5       	ldi	r18, 0x53	; 83
 252:	31 e0       	ldi	r19, 0x01	; 1
 254:	02 c0       	rjmp	.+4      	; 0x25a <usbPoll+0x132>
 256:	2d e3       	ldi	r18, 0x3D	; 61
 258:	31 e0       	ldi	r19, 0x01	; 1
 25a:	81 e0       	ldi	r24, 0x01	; 1
 25c:	03 c0       	rjmp	.+6      	; 0x264 <usbPoll+0x13c>
 25e:	2d e3       	ldi	r18, 0x3D	; 61
 260:	31 e0       	ldi	r19, 0x01	; 1
 262:	80 e0       	ldi	r24, 0x00	; 0
 264:	30 93 4f 01 	sts	0x014F, r19
 268:	20 93 4e 01 	sts	0x014E, r18
 26c:	07 c0       	rjmp	.+14     	; 0x27c <usbPoll+0x154>
 26e:	98 81       	ld	r25, Y
 270:	97 fd       	sbrc	r25, 7
 272:	8e 81       	ldd	r24, Y+6	; 0x06
 274:	90 e8       	ldi	r25, 0x80	; 128
 276:	90 93 14 01 	sts	0x0114, r25
 27a:	07 c0       	rjmp	.+14     	; 0x28a <usbPoll+0x162>
 27c:	9f 81       	ldd	r25, Y+7	; 0x07
 27e:	91 11       	cpse	r25, r1
 280:	04 c0       	rjmp	.+8      	; 0x28a <usbPoll+0x162>
 282:	9e 81       	ldd	r25, Y+6	; 0x06
 284:	98 17       	cp	r25, r24
 286:	08 f4       	brcc	.+2      	; 0x28a <usbPoll+0x162>
 288:	89 2f       	mov	r24, r25
 28a:	80 93 00 01 	sts	0x0100, r24
 28e:	0f c0       	rjmp	.+30     	; 0x2ae <usbPoll+0x186>
 290:	80 91 14 01 	lds	r24, 0x0114
 294:	87 ff       	sbrs	r24, 7
 296:	0b c0       	rjmp	.+22     	; 0x2ae <usbPoll+0x186>
 298:	ce 01       	movw	r24, r28
 29a:	f4 d1       	rcall	.+1000   	; 0x684 <usbFunctionWrite>
 29c:	8f 3f       	cpi	r24, 0xFF	; 255
 29e:	21 f4       	brne	.+8      	; 0x2a8 <usbPoll+0x180>
 2a0:	8e e1       	ldi	r24, 0x1E	; 30
 2a2:	80 93 01 01 	sts	0x0101, r24
 2a6:	03 c0       	rjmp	.+6      	; 0x2ae <usbPoll+0x186>
 2a8:	81 11       	cpse	r24, r1
 2aa:	10 92 00 01 	sts	0x0100, r1
 2ae:	10 92 50 01 	sts	0x0150, r1
 2b2:	80 91 01 01 	lds	r24, 0x0101
 2b6:	84 ff       	sbrs	r24, 4
 2b8:	5c c0       	rjmp	.+184    	; 0x372 <__stack+0x73>
 2ba:	80 91 00 01 	lds	r24, 0x0100
 2be:	8f 3f       	cpi	r24, 0xFF	; 255
 2c0:	09 f4       	brne	.+2      	; 0x2c4 <usbPoll+0x19c>
 2c2:	57 c0       	rjmp	.+174    	; 0x372 <__stack+0x73>
 2c4:	c8 2f       	mov	r28, r24
 2c6:	89 30       	cpi	r24, 0x09	; 9
 2c8:	08 f0       	brcs	.+2      	; 0x2cc <usbPoll+0x1a4>
 2ca:	c8 e0       	ldi	r28, 0x08	; 8
 2cc:	8c 1b       	sub	r24, r28
 2ce:	80 93 00 01 	sts	0x0100, r24
 2d2:	80 91 34 01 	lds	r24, 0x0134
 2d6:	98 e8       	ldi	r25, 0x88	; 136
 2d8:	89 27       	eor	r24, r25
 2da:	80 93 34 01 	sts	0x0134, r24
 2de:	cc 23       	and	r28, r28
 2e0:	b9 f1       	breq	.+110    	; 0x350 <__stack+0x51>
 2e2:	80 91 14 01 	lds	r24, 0x0114
 2e6:	87 ff       	sbrs	r24, 7
 2e8:	08 c0       	rjmp	.+16     	; 0x2fa <usbPoll+0x1d2>
 2ea:	6c 2f       	mov	r22, r28
 2ec:	85 e3       	ldi	r24, 0x35	; 53
 2ee:	91 e0       	ldi	r25, 0x01	; 1
 2f0:	af d1       	rcall	.+862    	; 0x650 <usbFunctionRead>
 2f2:	c8 2f       	mov	r28, r24
 2f4:	89 30       	cpi	r24, 0x09	; 9
 2f6:	b8 f5       	brcc	.+110    	; 0x366 <__stack+0x67>
 2f8:	2b c0       	rjmp	.+86     	; 0x350 <__stack+0x51>
 2fa:	20 91 4e 01 	lds	r18, 0x014E
 2fe:	30 91 4f 01 	lds	r19, 0x014F
 302:	86 ff       	sbrs	r24, 6
 304:	12 c0       	rjmp	.+36     	; 0x32a <__stack+0x2b>
 306:	a5 e3       	ldi	r26, 0x35	; 53
 308:	b1 e0       	ldi	r27, 0x01	; 1
 30a:	44 e3       	ldi	r20, 0x34	; 52
 30c:	51 e0       	ldi	r21, 0x01	; 1
 30e:	40 95       	com	r20
 310:	50 95       	com	r21
 312:	42 0f       	add	r20, r18
 314:	53 1f       	adc	r21, r19
 316:	8c 2f       	mov	r24, r28
 318:	8a 0f       	add	r24, r26
 31a:	fa 01       	movw	r30, r20
 31c:	ea 0f       	add	r30, r26
 31e:	fb 1f       	adc	r31, r27
 320:	e4 91       	lpm	r30, Z
 322:	ed 93       	st	X+, r30
 324:	8a 13       	cpse	r24, r26
 326:	f9 cf       	rjmp	.-14     	; 0x31a <__stack+0x1b>
 328:	09 c0       	rjmp	.+18     	; 0x33c <__stack+0x3d>
 32a:	e5 e3       	ldi	r30, 0x35	; 53
 32c:	f1 e0       	ldi	r31, 0x01	; 1
 32e:	d9 01       	movw	r26, r18
 330:	8c 2f       	mov	r24, r28
 332:	8e 0f       	add	r24, r30
 334:	9d 91       	ld	r25, X+
 336:	91 93       	st	Z+, r25
 338:	8e 13       	cpse	r24, r30
 33a:	fc cf       	rjmp	.-8      	; 0x334 <__stack+0x35>
 33c:	2f 5f       	subi	r18, 0xFF	; 255
 33e:	3f 4f       	sbci	r19, 0xFF	; 255
 340:	8f ef       	ldi	r24, 0xFF	; 255
 342:	8c 0f       	add	r24, r28
 344:	28 0f       	add	r18, r24
 346:	31 1d       	adc	r19, r1
 348:	30 93 4f 01 	sts	0x014F, r19
 34c:	20 93 4e 01 	sts	0x014E, r18
 350:	6c 2f       	mov	r22, r28
 352:	85 e3       	ldi	r24, 0x35	; 53
 354:	91 e0       	ldi	r25, 0x01	; 1
 356:	3c d0       	rcall	.+120    	; 0x3d0 <usbCrc16Append>
 358:	cc 5f       	subi	r28, 0xFC	; 252
 35a:	cc 30       	cpi	r28, 0x0C	; 12
 35c:	41 f0       	breq	.+16     	; 0x36e <__stack+0x6f>
 35e:	8f ef       	ldi	r24, 0xFF	; 255
 360:	80 93 00 01 	sts	0x0100, r24
 364:	04 c0       	rjmp	.+8      	; 0x36e <__stack+0x6f>
 366:	8f ef       	ldi	r24, 0xFF	; 255
 368:	80 93 00 01 	sts	0x0100, r24
 36c:	ce e1       	ldi	r28, 0x1E	; 30
 36e:	c0 93 01 01 	sts	0x0101, r28
 372:	84 e1       	ldi	r24, 0x14	; 20
 374:	93 b1       	in	r25, 0x03	; 3
 376:	93 70       	andi	r25, 0x03	; 3
 378:	31 f4       	brne	.+12     	; 0x386 <__stack+0x87>
 37a:	81 50       	subi	r24, 0x01	; 1
 37c:	d9 f7       	brne	.-10     	; 0x374 <__stack+0x75>
 37e:	10 92 51 01 	sts	0x0151, r1
 382:	10 92 4b 01 	sts	0x014B, r1
 386:	df 91       	pop	r29
 388:	cf 91       	pop	r28
 38a:	08 95       	ret

0000038c <usbInit>:
 38c:	e9 e6       	ldi	r30, 0x69	; 105
 38e:	f0 e0       	ldi	r31, 0x00	; 0
 390:	80 81       	ld	r24, Z
 392:	82 60       	ori	r24, 0x02	; 2
 394:	80 83       	st	Z, r24
 396:	e8 9a       	sbi	0x1d, 0	; 29
 398:	8b e4       	ldi	r24, 0x4B	; 75
 39a:	80 93 40 01 	sts	0x0140, r24
 39e:	8a e5       	ldi	r24, 0x5A	; 90
 3a0:	80 93 3f 01 	sts	0x013F, r24
 3a4:	08 95       	ret

000003a6 <usbCrc16>:
 3a6:	a8 2f       	mov	r26, r24
 3a8:	b9 2f       	mov	r27, r25
 3aa:	80 e0       	ldi	r24, 0x00	; 0
 3ac:	90 e0       	ldi	r25, 0x00	; 0
 3ae:	41 e0       	ldi	r20, 0x01	; 1
 3b0:	50 ea       	ldi	r21, 0xA0	; 160
 3b2:	60 95       	com	r22
 3b4:	30 e0       	ldi	r19, 0x00	; 0
 3b6:	09 c0       	rjmp	.+18     	; 0x3ca <usbCrcLoopEntry>

000003b8 <usbCrcByteLoop>:
 3b8:	2d 91       	ld	r18, X+
 3ba:	82 27       	eor	r24, r18

000003bc <usbCrcBitLoop>:
 3bc:	97 95       	ror	r25
 3be:	87 95       	ror	r24
 3c0:	10 f0       	brcs	.+4      	; 0x3c6 <usbCrcNoXor>
 3c2:	84 27       	eor	r24, r20
 3c4:	95 27       	eor	r25, r21

000003c6 <usbCrcNoXor>:
 3c6:	30 5e       	subi	r19, 0xE0	; 224
 3c8:	c8 f3       	brcs	.-14     	; 0x3bc <usbCrcBitLoop>

000003ca <usbCrcLoopEntry>:
 3ca:	6f 5f       	subi	r22, 0xFF	; 255
 3cc:	a8 f3       	brcs	.-22     	; 0x3b8 <usbCrcByteLoop>

000003ce <usbCrcReady>:
 3ce:	08 95       	ret

000003d0 <usbCrc16Append>:
 3d0:	ea df       	rcall	.-44     	; 0x3a6 <usbCrc16>
 3d2:	8d 93       	st	X+, r24
 3d4:	9d 93       	st	X+, r25
 3d6:	08 95       	ret

000003d8 <__vector_1>:
 3d8:	cf 93       	push	r28
 3da:	cf b7       	in	r28, 0x3f	; 63
 3dc:	cf 93       	push	r28

000003de <waitForJ>:
 3de:	c3 95       	inc	r28
 3e0:	18 9b       	sbis	0x03, 0	; 3
 3e2:	e9 f7       	brne	.-6      	; 0x3de <waitForJ>

000003e4 <waitForK>:
 3e4:	18 9b       	sbis	0x03, 0	; 3
 3e6:	09 c0       	rjmp	.+18     	; 0x3fa <foundK>
 3e8:	18 9b       	sbis	0x03, 0	; 3
 3ea:	07 c0       	rjmp	.+14     	; 0x3fa <foundK>
 3ec:	18 9b       	sbis	0x03, 0	; 3
 3ee:	05 c0       	rjmp	.+10     	; 0x3fa <foundK>
 3f0:	18 9b       	sbis	0x03, 0	; 3
 3f2:	03 c0       	rjmp	.+6      	; 0x3fa <foundK>
 3f4:	18 9b       	sbis	0x03, 0	; 3
 3f6:	01 c0       	rjmp	.+2      	; 0x3fa <foundK>
 3f8:	a3 c0       	rjmp	.+326    	; 0x540 <sofError>

000003fa <foundK>:
 3fa:	df 93       	push	r29
 3fc:	c0 91 4d 01 	lds	r28, 0x014D
 400:	dd 27       	eor	r29, r29
 402:	cc 5a       	subi	r28, 0xAC	; 172
 404:	de 4f       	sbci	r29, 0xFE	; 254
 406:	18 9b       	sbis	0x03, 0	; 3
 408:	02 c0       	rjmp	.+4      	; 0x40e <haveTwoBitsK>
 40a:	df 91       	pop	r29
 40c:	eb cf       	rjmp	.-42     	; 0x3e4 <waitForK>

0000040e <haveTwoBitsK>:
 40e:	2f 93       	push	r18
 410:	0f 93       	push	r16
 412:	1f 93       	push	r17
 414:	03 b1       	in	r16, 0x03	; 3
 416:	2f ef       	ldi	r18, 0xFF	; 255
 418:	00 fb       	bst	r16, 0
 41a:	20 f9       	bld	r18, 0
 41c:	4f 93       	push	r20
 41e:	3f 93       	push	r19
 420:	13 b1       	in	r17, 0x03	; 3
 422:	4f ef       	ldi	r20, 0xFF	; 255
 424:	01 27       	eor	r16, r17
 426:	00 fb       	bst	r16, 0
 428:	21 f9       	bld	r18, 1
 42a:	3b e0       	ldi	r19, 0x0B	; 11
 42c:	31 c0       	rjmp	.+98     	; 0x490 <rxbit2>

0000042e <unstuff0>:
 42e:	4e 7f       	andi	r20, 0xFE	; 254
 430:	01 2f       	mov	r16, r17
 432:	13 b1       	in	r17, 0x03	; 3
 434:	21 60       	ori	r18, 0x01	; 1
 436:	28 c0       	rjmp	.+80     	; 0x488 <didUnstuff0>

00000438 <unstuff1>:
 438:	10 2f       	mov	r17, r16
 43a:	4d 7f       	andi	r20, 0xFD	; 253
 43c:	22 60       	ori	r18, 0x02	; 2
 43e:	00 00       	nop
 440:	03 b1       	in	r16, 0x03	; 3
 442:	29 c0       	rjmp	.+82     	; 0x496 <didUnstuff1>

00000444 <unstuff2>:
 444:	4b 7f       	andi	r20, 0xFB	; 251
 446:	24 60       	ori	r18, 0x04	; 4
 448:	01 2f       	mov	r16, r17
 44a:	00 00       	nop
 44c:	13 b1       	in	r17, 0x03	; 3
 44e:	2b c0       	rjmp	.+86     	; 0x4a6 <didUnstuff2>

00000450 <unstuff3>:
 450:	13 b1       	in	r17, 0x03	; 3
 452:	47 7f       	andi	r20, 0xF7	; 247
 454:	28 60       	ori	r18, 0x08	; 8
 456:	2a c0       	rjmp	.+84     	; 0x4ac <didUnstuff3>

00000458 <unstuff4>:
 458:	4f 7e       	andi	r20, 0xEF	; 239
 45a:	03 b1       	in	r16, 0x03	; 3
 45c:	20 61       	ori	r18, 0x10	; 16
 45e:	2c c0       	rjmp	.+88     	; 0x4b8 <didUnstuff4>

00000460 <unstuff5>:
 460:	4f 7d       	andi	r20, 0xDF	; 223
 462:	13 b1       	in	r17, 0x03	; 3
 464:	20 62       	ori	r18, 0x20	; 32
 466:	2f c0       	rjmp	.+94     	; 0x4c6 <didUnstuff5>

00000468 <unstuff6>:
 468:	4f 7b       	andi	r20, 0xBF	; 191
 46a:	03 b1       	in	r16, 0x03	; 3
 46c:	20 64       	ori	r18, 0x40	; 64
 46e:	32 c0       	rjmp	.+100    	; 0x4d4 <didUnstuff6>

00000470 <rxLoop>:
 470:	42 27       	eor	r20, r18
 472:	03 b1       	in	r16, 0x03	; 3
 474:	49 93       	st	Y+, r20
 476:	4f ef       	ldi	r20, 0xFF	; 255
 478:	00 00       	nop
 47a:	10 27       	eor	r17, r16
 47c:	10 fb       	bst	r17, 0
 47e:	20 f9       	bld	r18, 0
 480:	13 b1       	in	r17, 0x03	; 3
 482:	13 70       	andi	r17, 0x03	; 3
 484:	c9 f1       	breq	.+114    	; 0x4f8 <se0>
 486:	29 7f       	andi	r18, 0xF9	; 249

00000488 <didUnstuff0>:
 488:	91 f2       	breq	.-92     	; 0x42e <unstuff0>
 48a:	01 27       	eor	r16, r17
 48c:	00 fb       	bst	r16, 0
 48e:	21 f9       	bld	r18, 1

00000490 <rxbit2>:
 490:	03 b1       	in	r16, 0x03	; 3
 492:	23 7f       	andi	r18, 0xF3	; 243
 494:	89 f2       	breq	.-94     	; 0x438 <unstuff1>

00000496 <didUnstuff1>:
 496:	31 50       	subi	r19, 0x01	; 1
 498:	58 f1       	brcs	.+86     	; 0x4f0 <overflow>
 49a:	10 27       	eor	r17, r16
 49c:	10 fb       	bst	r17, 0
 49e:	22 f9       	bld	r18, 2
 4a0:	13 b1       	in	r17, 0x03	; 3
 4a2:	27 7e       	andi	r18, 0xE7	; 231
 4a4:	79 f2       	breq	.-98     	; 0x444 <unstuff2>

000004a6 <didUnstuff2>:
 4a6:	01 27       	eor	r16, r17
 4a8:	00 fb       	bst	r16, 0
 4aa:	23 f9       	bld	r18, 3

000004ac <didUnstuff3>:
 4ac:	2f 7c       	andi	r18, 0xCF	; 207
 4ae:	81 f2       	breq	.-96     	; 0x450 <unstuff3>
 4b0:	03 b1       	in	r16, 0x03	; 3
 4b2:	10 27       	eor	r17, r16
 4b4:	10 fb       	bst	r17, 0
 4b6:	24 f9       	bld	r18, 4

000004b8 <didUnstuff4>:
 4b8:	2f 79       	andi	r18, 0x9F	; 159
 4ba:	71 f2       	breq	.-100    	; 0x458 <unstuff4>
 4bc:	00 c0       	rjmp	.+0      	; 0x4be <didUnstuff4+0x6>
 4be:	13 b1       	in	r17, 0x03	; 3
 4c0:	01 27       	eor	r16, r17
 4c2:	00 fb       	bst	r16, 0
 4c4:	25 f9       	bld	r18, 5

000004c6 <didUnstuff5>:
 4c6:	2f 73       	andi	r18, 0x3F	; 63
 4c8:	59 f2       	breq	.-106    	; 0x460 <unstuff5>
 4ca:	00 c0       	rjmp	.+0      	; 0x4cc <didUnstuff5+0x6>
 4cc:	03 b1       	in	r16, 0x03	; 3
 4ce:	10 27       	eor	r17, r16
 4d0:	10 fb       	bst	r17, 0
 4d2:	26 f9       	bld	r18, 6

000004d4 <didUnstuff6>:
 4d4:	22 30       	cpi	r18, 0x02	; 2
 4d6:	40 f2       	brcs	.-112    	; 0x468 <unstuff6>
 4d8:	00 c0       	rjmp	.+0      	; 0x4da <didUnstuff6+0x6>
 4da:	13 b1       	in	r17, 0x03	; 3
 4dc:	01 27       	eor	r16, r17
 4de:	00 fb       	bst	r16, 0
 4e0:	27 f9       	bld	r18, 7

000004e2 <didUnstuff7>:
 4e2:	24 30       	cpi	r18, 0x04	; 4
 4e4:	28 f6       	brcc	.-118    	; 0x470 <rxLoop>

000004e6 <unstuff7>:
 4e6:	4f 77       	andi	r20, 0x7F	; 127
 4e8:	20 68       	ori	r18, 0x80	; 128
 4ea:	13 b1       	in	r17, 0x03	; 3
 4ec:	00 00       	nop
 4ee:	f9 cf       	rjmp	.-14     	; 0x4e2 <didUnstuff7>

000004f0 <overflow>:
 4f0:	11 e0       	ldi	r17, 0x01	; 1
 4f2:	1c bb       	out	0x1c, r17	; 28

000004f4 <ignorePacket>:
 4f4:	00 27       	eor	r16, r16
 4f6:	19 c0       	rjmp	.+50     	; 0x52a <handleSetupOrOut>

000004f8 <se0>:
 4f8:	3b 50       	subi	r19, 0x0B	; 11
 4fa:	31 95       	neg	r19
 4fc:	c3 1b       	sub	r28, r19
 4fe:	d0 40       	sbci	r29, 0x00	; 0
 500:	11 e0       	ldi	r17, 0x01	; 1
 502:	1c bb       	out	0x1c, r17	; 28
 504:	08 81       	ld	r16, Y
 506:	03 3c       	cpi	r16, 0xC3	; 195
 508:	f9 f0       	breq	.+62     	; 0x548 <handleData>
 50a:	0b 34       	cpi	r16, 0x4B	; 75
 50c:	e9 f0       	breq	.+58     	; 0x548 <handleData>
 50e:	20 91 4b 01 	lds	r18, 0x014B
 512:	19 81       	ldd	r17, Y+1	; 0x01
 514:	11 0f       	add	r17, r17
 516:	12 13       	cpse	r17, r18
 518:	ed cf       	rjmp	.-38     	; 0x4f4 <ignorePacket>
 51a:	4a 81       	ldd	r20, Y+2	; 0x02
 51c:	44 1f       	adc	r20, r20
 51e:	09 36       	cpi	r16, 0x69	; 105
 520:	41 f1       	breq	.+80     	; 0x572 <handleIn>
 522:	0d 32       	cpi	r16, 0x2D	; 45
 524:	11 f0       	breq	.+4      	; 0x52a <handleSetupOrOut>
 526:	01 3e       	cpi	r16, 0xE1	; 225
 528:	29 f7       	brne	.-54     	; 0x4f4 <ignorePacket>

0000052a <handleSetupOrOut>:
 52a:	00 93 52 01 	sts	0x0152, r16

0000052e <doReturn>:
 52e:	3f 91       	pop	r19
 530:	4f 91       	pop	r20
 532:	1f 91       	pop	r17
 534:	0f 91       	pop	r16
 536:	2f 91       	pop	r18
 538:	df 91       	pop	r29
 53a:	cc b3       	in	r28, 0x1c	; 28
 53c:	c0 fd       	sbrc	r28, 0
 53e:	4f cf       	rjmp	.-354    	; 0x3de <waitForJ>

00000540 <sofError>:
 540:	cf 91       	pop	r28
 542:	cf bf       	out	0x3f, r28	; 63
 544:	cf 91       	pop	r28
 546:	18 95       	reti

00000548 <handleData>:
 548:	20 91 52 01 	lds	r18, 0x0152
 54c:	22 23       	and	r18, r18
 54e:	79 f3       	breq	.-34     	; 0x52e <doReturn>
 550:	10 91 50 01 	lds	r17, 0x0150
 554:	11 23       	and	r17, r17
 556:	69 f5       	brne	.+90     	; 0x5b2 <sendNakAndReti>
 558:	34 30       	cpi	r19, 0x04	; 4
 55a:	6a f1       	brmi	.+90     	; 0x5b6 <sendAckAndReti>
 55c:	30 93 50 01 	sts	0x0150, r19
 560:	20 93 4c 01 	sts	0x014C, r18
 564:	10 91 4d 01 	lds	r17, 0x014D
 568:	3b e0       	ldi	r19, 0x0B	; 11
 56a:	31 1b       	sub	r19, r17
 56c:	30 93 4d 01 	sts	0x014D, r19
 570:	22 c0       	rjmp	.+68     	; 0x5b6 <sendAckAndReti>

00000572 <handleIn>:
 572:	00 91 50 01 	lds	r16, 0x0150
 576:	01 30       	cpi	r16, 0x01	; 1
 578:	e4 f4       	brge	.+56     	; 0x5b2 <sendNakAndReti>
 57a:	0a e5       	ldi	r16, 0x5A	; 90
 57c:	4f 70       	andi	r20, 0x0F	; 15
 57e:	49 f4       	brne	.+18     	; 0x592 <handleIn1>
 580:	30 91 01 01 	lds	r19, 0x0101
 584:	34 fd       	sbrc	r19, 4
 586:	19 c0       	rjmp	.+50     	; 0x5ba <sendCntAndReti>
 588:	00 93 01 01 	sts	0x0101, r16
 58c:	c4 e3       	ldi	r28, 0x34	; 52
 58e:	d1 e0       	ldi	r29, 0x01	; 1
 590:	18 c0       	rjmp	.+48     	; 0x5c2 <usbSendAndReti>

00000592 <handleIn1>:
 592:	30 91 3f 01 	lds	r19, 0x013F
 596:	34 fd       	sbrc	r19, 4
 598:	10 c0       	rjmp	.+32     	; 0x5ba <sendCntAndReti>
 59a:	00 93 3f 01 	sts	0x013F, r16
 59e:	c0 e4       	ldi	r28, 0x40	; 64
 5a0:	d1 e0       	ldi	r29, 0x01	; 1
 5a2:	0f c0       	rjmp	.+30     	; 0x5c2 <usbSendAndReti>

000005a4 <stuffN1Delay>:
 5a4:	27 95       	ror	r18
 5a6:	a8 f4       	brcc	.+42     	; 0x5d2 <doExorN1>
 5a8:	51 50       	subi	r21, 0x01	; 1
 5aa:	a9 f4       	brne	.+42     	; 0x5d6 <commonN1>
 5ac:	22 0f       	add	r18, r18
 5ae:	00 00       	nop
 5b0:	f9 cf       	rjmp	.-14     	; 0x5a4 <stuffN1Delay>

000005b2 <sendNakAndReti>:
 5b2:	4a e5       	ldi	r20, 0x5A	; 90
 5b4:	03 c0       	rjmp	.+6      	; 0x5bc <usbSendX3>

000005b6 <sendAckAndReti>:
 5b6:	42 ed       	ldi	r20, 0xD2	; 210
 5b8:	01 c0       	rjmp	.+2      	; 0x5bc <usbSendX3>

000005ba <sendCntAndReti>:
 5ba:	43 2f       	mov	r20, r19

000005bc <usbSendX3>:
 5bc:	c4 e1       	ldi	r28, 0x14	; 20
 5be:	d0 e0       	ldi	r29, 0x00	; 0
 5c0:	32 e0       	ldi	r19, 0x02	; 2

000005c2 <usbSendAndReti>:
 5c2:	14 b1       	in	r17, 0x04	; 4
 5c4:	13 60       	ori	r17, 0x03	; 3
 5c6:	28 9a       	sbi	0x05, 0	; 5
 5c8:	14 b9       	out	0x04, r17	; 4
 5ca:	05 b1       	in	r16, 0x05	; 5
 5cc:	20 e4       	ldi	r18, 0x40	; 64
 5ce:	13 e0       	ldi	r17, 0x03	; 3
 5d0:	5f 93       	push	r21

000005d2 <doExorN1>:
 5d2:	01 27       	eor	r16, r17
 5d4:	56 e0       	ldi	r21, 0x06	; 6

000005d6 <commonN1>:
 5d6:	05 b9       	out	0x05, r16	; 5
 5d8:	27 95       	ror	r18
 5da:	20 f4       	brcc	.+8      	; 0x5e4 <doExorN2>
 5dc:	51 50       	subi	r21, 0x01	; 1
 5de:	21 f4       	brne	.+8      	; 0x5e8 <commonN2>
 5e0:	22 0f       	add	r18, r18
 5e2:	f9 cf       	rjmp	.-14     	; 0x5d6 <commonN1>

000005e4 <doExorN2>:
 5e4:	01 27       	eor	r16, r17
 5e6:	56 e0       	ldi	r21, 0x06	; 6

000005e8 <commonN2>:
 5e8:	00 00       	nop
 5ea:	3b 5a       	subi	r19, 0xAB	; 171
 5ec:	05 b9       	out	0x05, r16	; 5
 5ee:	d0 f2       	brcs	.-76     	; 0x5a4 <stuffN1Delay>

000005f0 <stuff6Delay>:
 5f0:	27 95       	ror	r18
 5f2:	28 f4       	brcc	.+10     	; 0x5fe <doExor6>
 5f4:	51 50       	subi	r21, 0x01	; 1
 5f6:	29 f4       	brne	.+10     	; 0x602 <common6>
 5f8:	22 0f       	add	r18, r18
 5fa:	00 00       	nop
 5fc:	f9 cf       	rjmp	.-14     	; 0x5f0 <stuff6Delay>

000005fe <doExor6>:
 5fe:	01 27       	eor	r16, r17
 600:	56 e0       	ldi	r21, 0x06	; 6

00000602 <common6>:
 602:	27 95       	ror	r18
 604:	05 b9       	out	0x05, r16	; 5
 606:	20 f4       	brcc	.+8      	; 0x610 <doExor7>
 608:	51 50       	subi	r21, 0x01	; 1
 60a:	21 f4       	brne	.+8      	; 0x614 <common7>
 60c:	22 0f       	add	r18, r18
 60e:	f9 cf       	rjmp	.-14     	; 0x602 <common6>

00000610 <doExor7>:
 610:	01 27       	eor	r16, r17
 612:	56 e0       	ldi	r21, 0x06	; 6

00000614 <common7>:
 614:	29 91       	ld	r18, Y+
 616:	33 23       	and	r19, r19
 618:	05 b9       	out	0x05, r16	; 5
 61a:	21 f6       	brne	.-120    	; 0x5a4 <stuffN1Delay>
 61c:	0c 7f       	andi	r16, 0xFC	; 252
 61e:	10 91 51 01 	lds	r17, 0x0151
 622:	11 0f       	add	r17, r17
 624:	c6 51       	subi	r28, 0x16	; 22
 626:	d0 40       	sbci	r29, 0x00	; 0
 628:	05 b9       	out	0x05, r16	; 5
 62a:	11 f0       	breq	.+4      	; 0x630 <skipAddrAssign>
 62c:	10 93 4b 01 	sts	0x014B, r17

00000630 <skipAddrAssign>:
 630:	11 e0       	ldi	r17, 0x01	; 1
 632:	1c bb       	out	0x1c, r17	; 28
 634:	01 60       	ori	r16, 0x01	; 1
 636:	14 b1       	in	r17, 0x04	; 4
 638:	1c 7f       	andi	r17, 0xFC	; 252
 63a:	40 2f       	mov	r20, r16
 63c:	4c 7f       	andi	r20, 0xFC	; 252
 63e:	5f 91       	pop	r21
 640:	00 c0       	rjmp	.+0      	; 0x642 <skipAddrAssign+0x12>
 642:	00 c0       	rjmp	.+0      	; 0x644 <skipAddrAssign+0x14>
 644:	05 b9       	out	0x05, r16	; 5
 646:	14 b9       	out	0x04, r17	; 4
 648:	45 b9       	out	0x05, r20	; 5
 64a:	71 cf       	rjmp	.-286    	; 0x52e <doReturn>

0000064c <__reset>:
 64c:	d9 cc       	rjmp	.-1614   	; 0x0 <__vectors>
 64e:	08 95       	ret

00000650 <usbFunctionRead>:
 650:	cf 93       	push	r28
 652:	20 91 15 01 	lds	r18, 0x0115
 656:	c6 2f       	mov	r28, r22
 658:	26 17       	cp	r18, r22
 65a:	08 f4       	brcc	.+2      	; 0x65e <usbFunctionRead+0xe>
 65c:	c2 2f       	mov	r28, r18
 65e:	4c 2f       	mov	r20, r28
 660:	50 e0       	ldi	r21, 0x00	; 0
 662:	60 91 16 01 	lds	r22, 0x0116
 666:	70 e0       	ldi	r23, 0x00	; 0
 668:	9e d3       	rcall	.+1852   	; 0xda6 <__eerd_block_m48>
 66a:	80 91 16 01 	lds	r24, 0x0116
 66e:	8c 0f       	add	r24, r28
 670:	80 93 16 01 	sts	0x0116, r24
 674:	80 91 15 01 	lds	r24, 0x0115
 678:	8c 1b       	sub	r24, r28
 67a:	80 93 15 01 	sts	0x0115, r24
 67e:	8c 2f       	mov	r24, r28
 680:	cf 91       	pop	r28
 682:	08 95       	ret

00000684 <usbFunctionWrite>:
 684:	cf 93       	push	r28
 686:	20 91 70 00 	lds	r18, 0x0070
 68a:	2e 7f       	andi	r18, 0xFE	; 254
 68c:	20 93 70 00 	sts	0x0070, r18
 690:	20 91 15 01 	lds	r18, 0x0115
 694:	c6 2f       	mov	r28, r22
 696:	26 17       	cp	r18, r22
 698:	08 f4       	brcc	.+2      	; 0x69c <usbFunctionWrite+0x18>
 69a:	c2 2f       	mov	r28, r18
 69c:	4c 2f       	mov	r20, r28
 69e:	50 e0       	ldi	r21, 0x00	; 0
 6a0:	60 91 16 01 	lds	r22, 0x0116
 6a4:	70 e0       	ldi	r23, 0x00	; 0
 6a6:	8e d3       	rcall	.+1820   	; 0xdc4 <__eewr_block_m48>
 6a8:	80 91 16 01 	lds	r24, 0x0116
 6ac:	8c 0f       	add	r24, r28
 6ae:	80 93 16 01 	sts	0x0116, r24
 6b2:	90 91 15 01 	lds	r25, 0x0115
 6b6:	9c 1b       	sub	r25, r28
 6b8:	90 93 15 01 	sts	0x0115, r25
 6bc:	91 11       	cpse	r25, r1
 6be:	01 c0       	rjmp	.+2      	; 0x6c2 <usbFunctionWrite+0x3e>
 6c0:	9f cc       	rjmp	.-1730   	; 0x0 <__vectors>
 6c2:	81 e0       	ldi	r24, 0x01	; 1
 6c4:	91 11       	cpse	r25, r1
 6c6:	80 e0       	ldi	r24, 0x00	; 0
 6c8:	cf 91       	pop	r28
 6ca:	08 95       	ret

000006cc <usbFunctionSetup>:
 6cc:	fc 01       	movw	r30, r24
 6ce:	20 81       	ld	r18, Z
 6d0:	20 76       	andi	r18, 0x60	; 96
 6d2:	20 32       	cpi	r18, 0x20	; 32
 6d4:	59 f4       	brne	.+22     	; 0x6ec <usbFunctionSetup+0x20>
 6d6:	81 81       	ldd	r24, Z+1	; 0x01
 6d8:	87 7f       	andi	r24, 0xF7	; 247
 6da:	81 30       	cpi	r24, 0x01	; 1
 6dc:	39 f4       	brne	.+14     	; 0x6ec <usbFunctionSetup+0x20>
 6de:	80 e8       	ldi	r24, 0x80	; 128
 6e0:	80 93 15 01 	sts	0x0115, r24
 6e4:	10 92 16 01 	sts	0x0116, r1
 6e8:	8f ef       	ldi	r24, 0xFF	; 255
 6ea:	08 95       	ret
 6ec:	80 e0       	ldi	r24, 0x00	; 0
 6ee:	08 95       	ret

000006f0 <message_dispatch>:
 6f0:	80 91 6a 01 	lds	r24, 0x016A
 6f4:	80 ff       	sbrs	r24, 0
 6f6:	06 c0       	rjmp	.+12     	; 0x704 <message_dispatch+0x14>
 6f8:	94 d1       	rcall	.+808    	; 0xa22 <service_sig_tick>
 6fa:	80 91 6a 01 	lds	r24, 0x016A
 6fe:	8e 7f       	andi	r24, 0xFE	; 254
 700:	80 93 6a 01 	sts	0x016A, r24
 704:	80 91 6a 01 	lds	r24, 0x016A
 708:	82 ff       	sbrs	r24, 2
 70a:	06 c0       	rjmp	.+12     	; 0x718 <message_dispatch+0x28>
 70c:	9b d1       	rcall	.+822    	; 0xa44 <service_sig_second>
 70e:	80 91 6a 01 	lds	r24, 0x016A
 712:	88 7f       	andi	r24, 0xF8	; 248
 714:	80 93 6a 01 	sts	0x016A, r24
 718:	80 91 6a 01 	lds	r24, 0x016A
 71c:	83 ff       	sbrs	r24, 3
 71e:	06 c0       	rjmp	.+12     	; 0x72c <message_dispatch+0x3c>
 720:	ad d1       	rcall	.+858    	; 0xa7c <service_sig_minute>
 722:	80 91 6a 01 	lds	r24, 0x016A
 726:	80 7f       	andi	r24, 0xF0	; 240
 728:	80 93 6a 01 	sts	0x016A, r24
 72c:	80 91 6a 01 	lds	r24, 0x016A
 730:	84 ff       	sbrs	r24, 4
 732:	06 c0       	rjmp	.+12     	; 0x740 <message_dispatch+0x50>
 734:	d2 d1       	rcall	.+932    	; 0xada <service_sig_hour>
 736:	80 91 6a 01 	lds	r24, 0x016A
 73a:	80 7e       	andi	r24, 0xE0	; 224
 73c:	80 93 6a 01 	sts	0x016A, r24
 740:	08 95       	ret

00000742 <power_on>:
 742:	80 91 0c 01 	lds	r24, 0x010C
 746:	41 9a       	sbi	0x08, 1	; 8
 748:	81 30       	cpi	r24, 0x01	; 1
 74a:	09 f4       	brne	.+2      	; 0x74e <power_on+0xc>
 74c:	08 95       	ret
 74e:	2f e7       	ldi	r18, 0x7F	; 127
 750:	89 ea       	ldi	r24, 0xA9	; 169
 752:	93 e0       	ldi	r25, 0x03	; 3
 754:	21 50       	subi	r18, 0x01	; 1
 756:	80 40       	sbci	r24, 0x00	; 0
 758:	90 40       	sbci	r25, 0x00	; 0
 75a:	e1 f7       	brne	.-8      	; 0x754 <power_on+0x12>
 75c:	00 c0       	rjmp	.+0      	; 0x75e <power_on+0x1c>
 75e:	00 00       	nop
 760:	41 98       	cbi	0x08, 1	; 8
 762:	08 95       	ret

00000764 <power_off>:
 764:	80 91 0c 01 	lds	r24, 0x010C
 768:	81 30       	cpi	r24, 0x01	; 1
 76a:	a9 f0       	breq	.+42     	; 0x796 <power_off+0x32>
 76c:	20 91 22 01 	lds	r18, 0x0122
 770:	30 91 23 01 	lds	r19, 0x0123
 774:	80 91 0a 01 	lds	r24, 0x010A
 778:	90 91 0b 01 	lds	r25, 0x010B
 77c:	28 17       	cp	r18, r24
 77e:	39 07       	cpc	r19, r25
 780:	51 f0       	breq	.+20     	; 0x796 <power_off+0x32>
 782:	41 9a       	sbi	0x08, 1	; 8
 784:	2f e7       	ldi	r18, 0x7F	; 127
 786:	89 ea       	ldi	r24, 0xA9	; 169
 788:	93 e0       	ldi	r25, 0x03	; 3
 78a:	21 50       	subi	r18, 0x01	; 1
 78c:	80 40       	sbci	r24, 0x00	; 0
 78e:	90 40       	sbci	r25, 0x00	; 0
 790:	e1 f7       	brne	.-8      	; 0x78a <power_off+0x26>
 792:	00 c0       	rjmp	.+0      	; 0x794 <power_off+0x30>
 794:	00 00       	nop
 796:	41 98       	cbi	0x08, 1	; 8
 798:	08 95       	ret

0000079a <timer_setup>:
 79a:	cf 93       	push	r28
 79c:	df 93       	push	r29
 79e:	c0 91 0d 01 	lds	r28, 0x010D
 7a2:	c1 11       	cpse	r28, r1
 7a4:	18 c0       	rjmp	.+48     	; 0x7d6 <timer_setup+0x3c>
 7a6:	81 e0       	ldi	r24, 0x01	; 1
 7a8:	80 93 0d 01 	sts	0x010D, r24
 7ac:	84 e0       	ldi	r24, 0x04	; 4
 7ae:	90 e0       	ldi	r25, 0x00	; 0
 7b0:	d3 d1       	rcall	.+934    	; 0xb58 <malloc>
 7b2:	90 93 21 01 	sts	0x0121, r25
 7b6:	80 93 20 01 	sts	0x0120, r24
 7ba:	20 91 04 01 	lds	r18, 0x0104
 7be:	30 91 05 01 	lds	r19, 0x0105
 7c2:	fc 01       	movw	r30, r24
 7c4:	31 83       	std	Z+1, r19	; 0x01
 7c6:	20 83       	st	Z, r18
 7c8:	20 91 06 01 	lds	r18, 0x0106
 7cc:	30 91 07 01 	lds	r19, 0x0107
 7d0:	33 83       	std	Z+3, r19	; 0x03
 7d2:	22 83       	std	Z+2, r18	; 0x02
 7d4:	14 c0       	rjmp	.+40     	; 0x7fe <timer_setup+0x64>
 7d6:	f4 e0       	ldi	r31, 0x04	; 4
 7d8:	cf 9f       	mul	r28, r31
 7da:	e0 01       	movw	r28, r0
 7dc:	11 24       	eor	r1, r1
 7de:	ce 01       	movw	r24, r28
 7e0:	bb d1       	rcall	.+886    	; 0xb58 <malloc>
 7e2:	90 93 21 01 	sts	0x0121, r25
 7e6:	80 93 20 01 	sts	0x0120, r24
 7ea:	00 97       	sbiw	r24, 0x00	; 0
 7ec:	51 f0       	breq	.+20     	; 0x802 <timer_setup+0x68>
 7ee:	ae 01       	movw	r20, r28
 7f0:	64 e1       	ldi	r22, 0x14	; 20
 7f2:	70 e0       	ldi	r23, 0x00	; 0
 7f4:	d8 d2       	rcall	.+1456   	; 0xda6 <__eerd_block_m48>
 7f6:	10 92 1f 01 	sts	0x011F, r1
 7fa:	10 92 1e 01 	sts	0x011E, r1
 7fe:	80 e0       	ldi	r24, 0x00	; 0
 800:	01 c0       	rjmp	.+2      	; 0x804 <timer_setup+0x6a>
 802:	8f ef       	ldi	r24, 0xFF	; 255
 804:	df 91       	pop	r29
 806:	cf 91       	pop	r28
 808:	08 95       	ret

0000080a <timer_check_status>:
 80a:	80 91 2a 01 	lds	r24, 0x012A
 80e:	90 91 2b 01 	lds	r25, 0x012B
 812:	8a 3a       	cpi	r24, 0xAA	; 170
 814:	95 45       	sbci	r25, 0x55	; 85
 816:	81 f4       	brne	.+32     	; 0x838 <timer_check_status+0x2e>
 818:	80 91 2c 01 	lds	r24, 0x012C
 81c:	90 91 2d 01 	lds	r25, 0x012D
 820:	20 91 2e 01 	lds	r18, 0x012E
 824:	30 91 2f 01 	lds	r19, 0x012F
 828:	82 17       	cp	r24, r18
 82a:	93 07       	cpc	r25, r19
 82c:	49 f0       	breq	.+18     	; 0x840 <timer_check_status+0x36>
 82e:	80 91 30 01 	lds	r24, 0x0130
 832:	90 91 31 01 	lds	r25, 0x0131
 836:	04 c0       	rjmp	.+8      	; 0x840 <timer_check_status+0x36>
 838:	80 91 0a 01 	lds	r24, 0x010A
 83c:	90 91 0b 01 	lds	r25, 0x010B
 840:	90 93 23 01 	sts	0x0123, r25
 844:	80 93 22 01 	sts	0x0122, r24
 848:	08 95       	ret

0000084a <update_status>:
 84a:	80 91 22 01 	lds	r24, 0x0122
 84e:	90 91 23 01 	lds	r25, 0x0123
 852:	90 93 2d 01 	sts	0x012D, r25
 856:	80 93 2c 01 	sts	0x012C, r24
 85a:	90 93 2f 01 	sts	0x012F, r25
 85e:	80 93 2e 01 	sts	0x012E, r24
 862:	90 93 31 01 	sts	0x0131, r25
 866:	80 93 30 01 	sts	0x0130, r24
 86a:	89 2b       	or	r24, r25
 86c:	39 f0       	breq	.+14     	; 0x87c <update_status+0x32>
 86e:	8a ea       	ldi	r24, 0xAA	; 170
 870:	95 e5       	ldi	r25, 0x55	; 85
 872:	90 93 2b 01 	sts	0x012B, r25
 876:	80 93 2a 01 	sts	0x012A, r24
 87a:	04 c0       	rjmp	.+8      	; 0x884 <update_status+0x3a>
 87c:	10 92 2b 01 	sts	0x012B, r1
 880:	10 92 2a 01 	sts	0x012A, r1
 884:	48 e0       	ldi	r20, 0x08	; 8
 886:	50 e0       	ldi	r21, 0x00	; 0
 888:	6c e0       	ldi	r22, 0x0C	; 12
 88a:	70 e0       	ldi	r23, 0x00	; 0
 88c:	8a e2       	ldi	r24, 0x2A	; 42
 88e:	91 e0       	ldi	r25, 0x01	; 1
 890:	99 c2       	rjmp	.+1330   	; 0xdc4 <__eewr_block_m48>

00000892 <timer_init>:
 892:	80 91 70 00 	lds	r24, 0x0070
 896:	81 60       	ori	r24, 0x01	; 1
 898:	80 93 70 00 	sts	0x0070, r24
 89c:	b8 9a       	sbi	0x17, 0	; 23
 89e:	80 91 b1 00 	lds	r24, 0x00B1
 8a2:	86 60       	ori	r24, 0x06	; 6
 8a4:	80 93 b1 00 	sts	0x00B1, r24
 8a8:	4c e0       	ldi	r20, 0x0C	; 12
 8aa:	50 e0       	ldi	r21, 0x00	; 0
 8ac:	60 e0       	ldi	r22, 0x00	; 0
 8ae:	70 e0       	ldi	r23, 0x00	; 0
 8b0:	82 e0       	ldi	r24, 0x02	; 2
 8b2:	91 e0       	ldi	r25, 0x01	; 1
 8b4:	78 d2       	rcall	.+1264   	; 0xda6 <__eerd_block_m48>
 8b6:	71 df       	rcall	.-286    	; 0x79a <timer_setup>
 8b8:	8f 3f       	cpi	r24, 0xFF	; 255
 8ba:	99 f0       	breq	.+38     	; 0x8e2 <timer_init+0x50>
 8bc:	44 e0       	ldi	r20, 0x04	; 4
 8be:	50 e0       	ldi	r21, 0x00	; 0
 8c0:	6c e7       	ldi	r22, 0x7C	; 124
 8c2:	70 e0       	ldi	r23, 0x00	; 0
 8c4:	86 e2       	ldi	r24, 0x26	; 38
 8c6:	91 e0       	ldi	r25, 0x01	; 1
 8c8:	6e d2       	rcall	.+1244   	; 0xda6 <__eerd_block_m48>
 8ca:	48 e0       	ldi	r20, 0x08	; 8
 8cc:	50 e0       	ldi	r21, 0x00	; 0
 8ce:	6c e0       	ldi	r22, 0x0C	; 12
 8d0:	70 e0       	ldi	r23, 0x00	; 0
 8d2:	8a e2       	ldi	r24, 0x2A	; 42
 8d4:	91 e0       	ldi	r25, 0x01	; 1
 8d6:	67 d2       	rcall	.+1230   	; 0xda6 <__eerd_block_m48>
 8d8:	98 df       	rcall	.-208    	; 0x80a <timer_check_status>
 8da:	b7 df       	rcall	.-146    	; 0x84a <update_status>
 8dc:	43 df       	rcall	.-378    	; 0x764 <power_off>
 8de:	82 e0       	ldi	r24, 0x02	; 2
 8e0:	87 b9       	out	0x07, r24	; 7
 8e2:	08 95       	ret

000008e4 <timer_switch>:
 8e4:	80 91 08 01 	lds	r24, 0x0108
 8e8:	90 91 09 01 	lds	r25, 0x0109
 8ec:	04 97       	sbiw	r24, 0x04	; 4
 8ee:	19 f4       	brne	.+6      	; 0x8f6 <timer_switch+0x12>
 8f0:	86 e2       	ldi	r24, 0x26	; 38
 8f2:	91 e0       	ldi	r25, 0x01	; 1
 8f4:	02 c0       	rjmp	.+4      	; 0x8fa <timer_switch+0x16>
 8f6:	8a e1       	ldi	r24, 0x1A	; 26
 8f8:	91 e0       	ldi	r25, 0x01	; 1
 8fa:	90 93 1d 01 	sts	0x011D, r25
 8fe:	80 93 1c 01 	sts	0x011C, r24
 902:	80 91 19 01 	lds	r24, 0x0119
 906:	81 11       	cpse	r24, r1
 908:	2c c0       	rjmp	.+88     	; 0x962 <timer_switch+0x7e>
 90a:	80 91 1a 01 	lds	r24, 0x011A
 90e:	90 91 1b 01 	lds	r25, 0x011B
 912:	01 96       	adiw	r24, 0x01	; 1
 914:	90 93 1b 01 	sts	0x011B, r25
 918:	80 93 1a 01 	sts	0x011A, r24
 91c:	a0 91 1c 01 	lds	r26, 0x011C
 920:	b0 91 1d 01 	lds	r27, 0x011D
 924:	80 91 1e 01 	lds	r24, 0x011E
 928:	90 91 1f 01 	lds	r25, 0x011F
 92c:	88 0f       	add	r24, r24
 92e:	99 1f       	adc	r25, r25
 930:	88 0f       	add	r24, r24
 932:	99 1f       	adc	r25, r25
 934:	e0 91 20 01 	lds	r30, 0x0120
 938:	f0 91 21 01 	lds	r31, 0x0121
 93c:	e8 0f       	add	r30, r24
 93e:	f9 1f       	adc	r31, r25
 940:	2d 91       	ld	r18, X+
 942:	3c 91       	ld	r19, X
 944:	82 81       	ldd	r24, Z+2	; 0x02
 946:	93 81       	ldd	r25, Z+3	; 0x03
 948:	28 17       	cp	r18, r24
 94a:	39 07       	cpc	r19, r25
 94c:	09 f0       	breq	.+2      	; 0x950 <timer_switch+0x6c>
 94e:	4c c0       	rjmp	.+152    	; 0x9e8 <timer_switch+0x104>
 950:	f8 de       	rcall	.-528    	; 0x742 <power_on>
 952:	81 e0       	ldi	r24, 0x01	; 1
 954:	80 93 19 01 	sts	0x0119, r24
 958:	10 92 18 01 	sts	0x0118, r1
 95c:	10 92 17 01 	sts	0x0117, r1
 960:	08 95       	ret
 962:	81 30       	cpi	r24, 0x01	; 1
 964:	09 f0       	breq	.+2      	; 0x968 <timer_switch+0x84>
 966:	40 c0       	rjmp	.+128    	; 0x9e8 <timer_switch+0x104>
 968:	80 91 17 01 	lds	r24, 0x0117
 96c:	90 91 18 01 	lds	r25, 0x0118
 970:	01 96       	adiw	r24, 0x01	; 1
 972:	90 93 18 01 	sts	0x0118, r25
 976:	80 93 17 01 	sts	0x0117, r24
 97a:	20 91 1e 01 	lds	r18, 0x011E
 97e:	30 91 1f 01 	lds	r19, 0x011F
 982:	22 0f       	add	r18, r18
 984:	33 1f       	adc	r19, r19
 986:	22 0f       	add	r18, r18
 988:	33 1f       	adc	r19, r19
 98a:	e0 91 20 01 	lds	r30, 0x0120
 98e:	f0 91 21 01 	lds	r31, 0x0121
 992:	e2 0f       	add	r30, r18
 994:	f3 1f       	adc	r31, r19
 996:	20 81       	ld	r18, Z
 998:	31 81       	ldd	r19, Z+1	; 0x01
 99a:	82 17       	cp	r24, r18
 99c:	93 07       	cpc	r25, r19
 99e:	21 f5       	brne	.+72     	; 0x9e8 <timer_switch+0x104>
 9a0:	e1 de       	rcall	.-574    	; 0x764 <power_off>
 9a2:	10 92 19 01 	sts	0x0119, r1
 9a6:	10 92 1b 01 	sts	0x011B, r1
 9aa:	10 92 1a 01 	sts	0x011A, r1
 9ae:	80 91 1e 01 	lds	r24, 0x011E
 9b2:	90 91 1f 01 	lds	r25, 0x011F
 9b6:	01 96       	adiw	r24, 0x01	; 1
 9b8:	90 93 1f 01 	sts	0x011F, r25
 9bc:	80 93 1e 01 	sts	0x011E, r24
 9c0:	20 91 0d 01 	lds	r18, 0x010D
 9c4:	30 e0       	ldi	r19, 0x00	; 0
 9c6:	82 17       	cp	r24, r18
 9c8:	93 07       	cpc	r25, r19
 9ca:	71 f4       	brne	.+28     	; 0x9e8 <timer_switch+0x104>
 9cc:	80 91 22 01 	lds	r24, 0x0122
 9d0:	90 91 23 01 	lds	r25, 0x0123
 9d4:	01 97       	sbiw	r24, 0x01	; 1
 9d6:	90 93 23 01 	sts	0x0123, r25
 9da:	80 93 22 01 	sts	0x0122, r24
 9de:	10 92 1f 01 	sts	0x011F, r1
 9e2:	10 92 1e 01 	sts	0x011E, r1
 9e6:	31 cf       	rjmp	.-414    	; 0x84a <update_status>
 9e8:	08 95       	ret

000009ea <__vector_9>:
 9ea:	1f 92       	push	r1
 9ec:	0f 92       	push	r0
 9ee:	0f b6       	in	r0, 0x3f	; 63
 9f0:	0f 92       	push	r0
 9f2:	11 24       	eor	r1, r1
 9f4:	8f 93       	push	r24
 9f6:	9f 93       	push	r25
 9f8:	80 91 32 01 	lds	r24, 0x0132
 9fc:	90 91 33 01 	lds	r25, 0x0133
 a00:	01 96       	adiw	r24, 0x01	; 1
 a02:	90 93 33 01 	sts	0x0133, r25
 a06:	80 93 32 01 	sts	0x0132, r24
 a0a:	80 91 6a 01 	lds	r24, 0x016A
 a0e:	81 60       	ori	r24, 0x01	; 1
 a10:	80 93 6a 01 	sts	0x016A, r24
 a14:	9f 91       	pop	r25
 a16:	8f 91       	pop	r24
 a18:	0f 90       	pop	r0
 a1a:	0f be       	out	0x3f, r0	; 63
 a1c:	0f 90       	pop	r0
 a1e:	1f 90       	pop	r1
 a20:	18 95       	reti

00000a22 <service_sig_tick>:
 a22:	80 91 32 01 	lds	r24, 0x0132
 a26:	90 91 33 01 	lds	r25, 0x0133
 a2a:	87 3b       	cpi	r24, 0xB7	; 183
 a2c:	91 05       	cpc	r25, r1
 a2e:	49 f4       	brne	.+18     	; 0xa42 <service_sig_tick+0x20>
 a30:	80 91 6a 01 	lds	r24, 0x016A
 a34:	84 60       	ori	r24, 0x04	; 4
 a36:	80 93 6a 01 	sts	0x016A, r24
 a3a:	10 92 33 01 	sts	0x0133, r1
 a3e:	10 92 32 01 	sts	0x0132, r1
 a42:	08 95       	ret

00000a44 <service_sig_second>:
 a44:	80 91 25 01 	lds	r24, 0x0125
 a48:	8f 5f       	subi	r24, 0xFF	; 255
 a4a:	80 93 25 01 	sts	0x0125, r24
 a4e:	8c 33       	cpi	r24, 0x3C	; 60
 a50:	39 f4       	brne	.+14     	; 0xa60 <service_sig_second+0x1c>
 a52:	80 91 6a 01 	lds	r24, 0x016A
 a56:	88 60       	ori	r24, 0x08	; 8
 a58:	80 93 6a 01 	sts	0x016A, r24
 a5c:	10 92 25 01 	sts	0x0125, r1
 a60:	80 91 08 01 	lds	r24, 0x0108
 a64:	90 91 09 01 	lds	r25, 0x0109
 a68:	01 97       	sbiw	r24, 0x01	; 1
 a6a:	39 f4       	brne	.+14     	; 0xa7a <service_sig_second+0x36>
 a6c:	80 91 22 01 	lds	r24, 0x0122
 a70:	90 91 23 01 	lds	r25, 0x0123
 a74:	89 2b       	or	r24, r25
 a76:	09 f0       	breq	.+2      	; 0xa7a <service_sig_second+0x36>
 a78:	35 cf       	rjmp	.-406    	; 0x8e4 <timer_switch>
 a7a:	08 95       	ret

00000a7c <service_sig_minute>:
 a7c:	80 91 26 01 	lds	r24, 0x0126
 a80:	8f 5f       	subi	r24, 0xFF	; 255
 a82:	80 93 26 01 	sts	0x0126, r24
 a86:	8c 33       	cpi	r24, 0x3C	; 60
 a88:	39 f4       	brne	.+14     	; 0xa98 <service_sig_minute+0x1c>
 a8a:	80 91 6a 01 	lds	r24, 0x016A
 a8e:	80 61       	ori	r24, 0x10	; 16
 a90:	80 93 6a 01 	sts	0x016A, r24
 a94:	10 92 26 01 	sts	0x0126, r1
 a98:	80 91 08 01 	lds	r24, 0x0108
 a9c:	90 91 09 01 	lds	r25, 0x0109
 aa0:	02 97       	sbiw	r24, 0x02	; 2
 aa2:	39 f4       	brne	.+14     	; 0xab2 <service_sig_minute+0x36>
 aa4:	80 91 22 01 	lds	r24, 0x0122
 aa8:	90 91 23 01 	lds	r25, 0x0123
 aac:	89 2b       	or	r24, r25
 aae:	09 f0       	breq	.+2      	; 0xab2 <service_sig_minute+0x36>
 ab0:	19 df       	rcall	.-462    	; 0x8e4 <timer_switch>
 ab2:	80 91 08 01 	lds	r24, 0x0108
 ab6:	90 91 09 01 	lds	r25, 0x0109
 aba:	04 97       	sbiw	r24, 0x04	; 4
 abc:	39 f4       	brne	.+14     	; 0xacc <service_sig_minute+0x50>
 abe:	80 91 22 01 	lds	r24, 0x0122
 ac2:	90 91 23 01 	lds	r25, 0x0123
 ac6:	89 2b       	or	r24, r25
 ac8:	09 f0       	breq	.+2      	; 0xacc <service_sig_minute+0x50>
 aca:	0c df       	rcall	.-488    	; 0x8e4 <timer_switch>
 acc:	44 e0       	ldi	r20, 0x04	; 4
 ace:	50 e0       	ldi	r21, 0x00	; 0
 ad0:	6c e7       	ldi	r22, 0x7C	; 124
 ad2:	70 e0       	ldi	r23, 0x00	; 0
 ad4:	86 e2       	ldi	r24, 0x26	; 38
 ad6:	91 e0       	ldi	r25, 0x01	; 1
 ad8:	75 c1       	rjmp	.+746    	; 0xdc4 <__eewr_block_m48>

00000ada <service_sig_hour>:
 ada:	80 91 27 01 	lds	r24, 0x0127
 ade:	8f 5f       	subi	r24, 0xFF	; 255
 ae0:	80 93 27 01 	sts	0x0127, r24
 ae4:	88 31       	cpi	r24, 0x18	; 24
 ae6:	59 f4       	brne	.+22     	; 0xafe <service_sig_hour+0x24>
 ae8:	80 91 28 01 	lds	r24, 0x0128
 aec:	90 91 29 01 	lds	r25, 0x0129
 af0:	01 96       	adiw	r24, 0x01	; 1
 af2:	90 93 29 01 	sts	0x0129, r25
 af6:	80 93 28 01 	sts	0x0128, r24
 afa:	10 92 27 01 	sts	0x0127, r1
 afe:	80 91 08 01 	lds	r24, 0x0108
 b02:	90 91 09 01 	lds	r25, 0x0109
 b06:	03 97       	sbiw	r24, 0x03	; 3
 b08:	39 f4       	brne	.+14     	; 0xb18 <service_sig_hour+0x3e>
 b0a:	80 91 22 01 	lds	r24, 0x0122
 b0e:	90 91 23 01 	lds	r25, 0x0123
 b12:	89 2b       	or	r24, r25
 b14:	09 f0       	breq	.+2      	; 0xb18 <service_sig_hour+0x3e>
 b16:	e6 ce       	rjmp	.-564    	; 0x8e4 <timer_switch>
 b18:	08 95       	ret

00000b1a <main>:
 b1a:	2e e0       	ldi	r18, 0x0E	; 14
 b1c:	88 e1       	ldi	r24, 0x18	; 24
 b1e:	90 e0       	ldi	r25, 0x00	; 0
 b20:	0f b6       	in	r0, 0x3f	; 63
 b22:	f8 94       	cli
 b24:	a8 95       	wdr
 b26:	80 93 60 00 	sts	0x0060, r24
 b2a:	0f be       	out	0x3f, r0	; 63
 b2c:	20 93 60 00 	sts	0x0060, r18
 b30:	2d dc       	rcall	.-1958   	; 0x38c <usbInit>
 b32:	af de       	rcall	.-674    	; 0x892 <timer_init>
 b34:	20 9a       	sbi	0x04, 0	; 4
 b36:	80 e0       	ldi	r24, 0x00	; 0
 b38:	81 50       	subi	r24, 0x01	; 1
 b3a:	41 f0       	breq	.+16     	; 0xb4c <main+0x32>
 b3c:	a8 95       	wdr
 b3e:	e7 eb       	ldi	r30, 0xB7	; 183
 b40:	fb e0       	ldi	r31, 0x0B	; 11
 b42:	31 97       	sbiw	r30, 0x01	; 1
 b44:	f1 f7       	brne	.-4      	; 0xb42 <main+0x28>
 b46:	00 c0       	rjmp	.+0      	; 0xb48 <main+0x2e>
 b48:	00 00       	nop
 b4a:	f6 cf       	rjmp	.-20     	; 0xb38 <main+0x1e>
 b4c:	20 98       	cbi	0x04, 0	; 4
 b4e:	78 94       	sei
 b50:	a8 95       	wdr
 b52:	ea da       	rcall	.-2604   	; 0x128 <usbPoll>
 b54:	cd dd       	rcall	.-1126   	; 0x6f0 <message_dispatch>
 b56:	fc cf       	rjmp	.-8      	; 0xb50 <main+0x36>

00000b58 <malloc>:
 b58:	cf 93       	push	r28
 b5a:	df 93       	push	r29
 b5c:	82 30       	cpi	r24, 0x02	; 2
 b5e:	91 05       	cpc	r25, r1
 b60:	10 f4       	brcc	.+4      	; 0xb66 <malloc+0xe>
 b62:	82 e0       	ldi	r24, 0x02	; 2
 b64:	90 e0       	ldi	r25, 0x00	; 0
 b66:	e0 91 6d 01 	lds	r30, 0x016D
 b6a:	f0 91 6e 01 	lds	r31, 0x016E
 b6e:	20 e0       	ldi	r18, 0x00	; 0
 b70:	30 e0       	ldi	r19, 0x00	; 0
 b72:	a0 e0       	ldi	r26, 0x00	; 0
 b74:	b0 e0       	ldi	r27, 0x00	; 0
 b76:	30 97       	sbiw	r30, 0x00	; 0
 b78:	39 f1       	breq	.+78     	; 0xbc8 <malloc+0x70>
 b7a:	40 81       	ld	r20, Z
 b7c:	51 81       	ldd	r21, Z+1	; 0x01
 b7e:	48 17       	cp	r20, r24
 b80:	59 07       	cpc	r21, r25
 b82:	b8 f0       	brcs	.+46     	; 0xbb2 <malloc+0x5a>
 b84:	48 17       	cp	r20, r24
 b86:	59 07       	cpc	r21, r25
 b88:	71 f4       	brne	.+28     	; 0xba6 <malloc+0x4e>
 b8a:	82 81       	ldd	r24, Z+2	; 0x02
 b8c:	93 81       	ldd	r25, Z+3	; 0x03
 b8e:	10 97       	sbiw	r26, 0x00	; 0
 b90:	29 f0       	breq	.+10     	; 0xb9c <malloc+0x44>
 b92:	13 96       	adiw	r26, 0x03	; 3
 b94:	9c 93       	st	X, r25
 b96:	8e 93       	st	-X, r24
 b98:	12 97       	sbiw	r26, 0x02	; 2
 b9a:	2c c0       	rjmp	.+88     	; 0xbf4 <malloc+0x9c>
 b9c:	90 93 6e 01 	sts	0x016E, r25
 ba0:	80 93 6d 01 	sts	0x016D, r24
 ba4:	27 c0       	rjmp	.+78     	; 0xbf4 <malloc+0x9c>
 ba6:	21 15       	cp	r18, r1
 ba8:	31 05       	cpc	r19, r1
 baa:	31 f0       	breq	.+12     	; 0xbb8 <malloc+0x60>
 bac:	42 17       	cp	r20, r18
 bae:	53 07       	cpc	r21, r19
 bb0:	18 f0       	brcs	.+6      	; 0xbb8 <malloc+0x60>
 bb2:	a9 01       	movw	r20, r18
 bb4:	db 01       	movw	r26, r22
 bb6:	01 c0       	rjmp	.+2      	; 0xbba <malloc+0x62>
 bb8:	ef 01       	movw	r28, r30
 bba:	9a 01       	movw	r18, r20
 bbc:	bd 01       	movw	r22, r26
 bbe:	df 01       	movw	r26, r30
 bc0:	02 80       	ldd	r0, Z+2	; 0x02
 bc2:	f3 81       	ldd	r31, Z+3	; 0x03
 bc4:	e0 2d       	mov	r30, r0
 bc6:	d7 cf       	rjmp	.-82     	; 0xb76 <malloc+0x1e>
 bc8:	21 15       	cp	r18, r1
 bca:	31 05       	cpc	r19, r1
 bcc:	f9 f0       	breq	.+62     	; 0xc0c <malloc+0xb4>
 bce:	28 1b       	sub	r18, r24
 bd0:	39 0b       	sbc	r19, r25
 bd2:	24 30       	cpi	r18, 0x04	; 4
 bd4:	31 05       	cpc	r19, r1
 bd6:	80 f4       	brcc	.+32     	; 0xbf8 <malloc+0xa0>
 bd8:	8a 81       	ldd	r24, Y+2	; 0x02
 bda:	9b 81       	ldd	r25, Y+3	; 0x03
 bdc:	61 15       	cp	r22, r1
 bde:	71 05       	cpc	r23, r1
 be0:	21 f0       	breq	.+8      	; 0xbea <malloc+0x92>
 be2:	fb 01       	movw	r30, r22
 be4:	93 83       	std	Z+3, r25	; 0x03
 be6:	82 83       	std	Z+2, r24	; 0x02
 be8:	04 c0       	rjmp	.+8      	; 0xbf2 <malloc+0x9a>
 bea:	90 93 6e 01 	sts	0x016E, r25
 bee:	80 93 6d 01 	sts	0x016D, r24
 bf2:	fe 01       	movw	r30, r28
 bf4:	32 96       	adiw	r30, 0x02	; 2
 bf6:	44 c0       	rjmp	.+136    	; 0xc80 <malloc+0x128>
 bf8:	fe 01       	movw	r30, r28
 bfa:	e2 0f       	add	r30, r18
 bfc:	f3 1f       	adc	r31, r19
 bfe:	81 93       	st	Z+, r24
 c00:	91 93       	st	Z+, r25
 c02:	22 50       	subi	r18, 0x02	; 2
 c04:	31 09       	sbc	r19, r1
 c06:	39 83       	std	Y+1, r19	; 0x01
 c08:	28 83       	st	Y, r18
 c0a:	3a c0       	rjmp	.+116    	; 0xc80 <malloc+0x128>
 c0c:	20 91 6b 01 	lds	r18, 0x016B
 c10:	30 91 6c 01 	lds	r19, 0x016C
 c14:	23 2b       	or	r18, r19
 c16:	41 f4       	brne	.+16     	; 0xc28 <malloc+0xd0>
 c18:	20 91 10 01 	lds	r18, 0x0110
 c1c:	30 91 11 01 	lds	r19, 0x0111
 c20:	30 93 6c 01 	sts	0x016C, r19
 c24:	20 93 6b 01 	sts	0x016B, r18
 c28:	20 91 0e 01 	lds	r18, 0x010E
 c2c:	30 91 0f 01 	lds	r19, 0x010F
 c30:	21 15       	cp	r18, r1
 c32:	31 05       	cpc	r19, r1
 c34:	41 f4       	brne	.+16     	; 0xc46 <malloc+0xee>
 c36:	2d b7       	in	r18, 0x3d	; 61
 c38:	3e b7       	in	r19, 0x3e	; 62
 c3a:	40 91 12 01 	lds	r20, 0x0112
 c3e:	50 91 13 01 	lds	r21, 0x0113
 c42:	24 1b       	sub	r18, r20
 c44:	35 0b       	sbc	r19, r21
 c46:	e0 91 6b 01 	lds	r30, 0x016B
 c4a:	f0 91 6c 01 	lds	r31, 0x016C
 c4e:	e2 17       	cp	r30, r18
 c50:	f3 07       	cpc	r31, r19
 c52:	a0 f4       	brcc	.+40     	; 0xc7c <malloc+0x124>
 c54:	2e 1b       	sub	r18, r30
 c56:	3f 0b       	sbc	r19, r31
 c58:	28 17       	cp	r18, r24
 c5a:	39 07       	cpc	r19, r25
 c5c:	78 f0       	brcs	.+30     	; 0xc7c <malloc+0x124>
 c5e:	ac 01       	movw	r20, r24
 c60:	4e 5f       	subi	r20, 0xFE	; 254
 c62:	5f 4f       	sbci	r21, 0xFF	; 255
 c64:	24 17       	cp	r18, r20
 c66:	35 07       	cpc	r19, r21
 c68:	48 f0       	brcs	.+18     	; 0xc7c <malloc+0x124>
 c6a:	4e 0f       	add	r20, r30
 c6c:	5f 1f       	adc	r21, r31
 c6e:	50 93 6c 01 	sts	0x016C, r21
 c72:	40 93 6b 01 	sts	0x016B, r20
 c76:	81 93       	st	Z+, r24
 c78:	91 93       	st	Z+, r25
 c7a:	02 c0       	rjmp	.+4      	; 0xc80 <malloc+0x128>
 c7c:	e0 e0       	ldi	r30, 0x00	; 0
 c7e:	f0 e0       	ldi	r31, 0x00	; 0
 c80:	cf 01       	movw	r24, r30
 c82:	df 91       	pop	r29
 c84:	cf 91       	pop	r28
 c86:	08 95       	ret

00000c88 <free>:
 c88:	cf 93       	push	r28
 c8a:	df 93       	push	r29
 c8c:	00 97       	sbiw	r24, 0x00	; 0
 c8e:	09 f4       	brne	.+2      	; 0xc92 <free+0xa>
 c90:	87 c0       	rjmp	.+270    	; 0xda0 <free+0x118>
 c92:	fc 01       	movw	r30, r24
 c94:	32 97       	sbiw	r30, 0x02	; 2
 c96:	13 82       	std	Z+3, r1	; 0x03
 c98:	12 82       	std	Z+2, r1	; 0x02
 c9a:	c0 91 6d 01 	lds	r28, 0x016D
 c9e:	d0 91 6e 01 	lds	r29, 0x016E
 ca2:	20 97       	sbiw	r28, 0x00	; 0
 ca4:	81 f4       	brne	.+32     	; 0xcc6 <free+0x3e>
 ca6:	20 81       	ld	r18, Z
 ca8:	31 81       	ldd	r19, Z+1	; 0x01
 caa:	28 0f       	add	r18, r24
 cac:	39 1f       	adc	r19, r25
 cae:	80 91 6b 01 	lds	r24, 0x016B
 cb2:	90 91 6c 01 	lds	r25, 0x016C
 cb6:	82 17       	cp	r24, r18
 cb8:	93 07       	cpc	r25, r19
 cba:	79 f5       	brne	.+94     	; 0xd1a <free+0x92>
 cbc:	f0 93 6c 01 	sts	0x016C, r31
 cc0:	e0 93 6b 01 	sts	0x016B, r30
 cc4:	6d c0       	rjmp	.+218    	; 0xda0 <free+0x118>
 cc6:	de 01       	movw	r26, r28
 cc8:	20 e0       	ldi	r18, 0x00	; 0
 cca:	30 e0       	ldi	r19, 0x00	; 0
 ccc:	ae 17       	cp	r26, r30
 cce:	bf 07       	cpc	r27, r31
 cd0:	50 f4       	brcc	.+20     	; 0xce6 <free+0x5e>
 cd2:	12 96       	adiw	r26, 0x02	; 2
 cd4:	4d 91       	ld	r20, X+
 cd6:	5c 91       	ld	r21, X
 cd8:	13 97       	sbiw	r26, 0x03	; 3
 cda:	9d 01       	movw	r18, r26
 cdc:	41 15       	cp	r20, r1
 cde:	51 05       	cpc	r21, r1
 ce0:	09 f1       	breq	.+66     	; 0xd24 <free+0x9c>
 ce2:	da 01       	movw	r26, r20
 ce4:	f3 cf       	rjmp	.-26     	; 0xccc <free+0x44>
 ce6:	b3 83       	std	Z+3, r27	; 0x03
 ce8:	a2 83       	std	Z+2, r26	; 0x02
 cea:	40 81       	ld	r20, Z
 cec:	51 81       	ldd	r21, Z+1	; 0x01
 cee:	84 0f       	add	r24, r20
 cf0:	95 1f       	adc	r25, r21
 cf2:	8a 17       	cp	r24, r26
 cf4:	9b 07       	cpc	r25, r27
 cf6:	71 f4       	brne	.+28     	; 0xd14 <free+0x8c>
 cf8:	8d 91       	ld	r24, X+
 cfa:	9c 91       	ld	r25, X
 cfc:	11 97       	sbiw	r26, 0x01	; 1
 cfe:	84 0f       	add	r24, r20
 d00:	95 1f       	adc	r25, r21
 d02:	02 96       	adiw	r24, 0x02	; 2
 d04:	91 83       	std	Z+1, r25	; 0x01
 d06:	80 83       	st	Z, r24
 d08:	12 96       	adiw	r26, 0x02	; 2
 d0a:	8d 91       	ld	r24, X+
 d0c:	9c 91       	ld	r25, X
 d0e:	13 97       	sbiw	r26, 0x03	; 3
 d10:	93 83       	std	Z+3, r25	; 0x03
 d12:	82 83       	std	Z+2, r24	; 0x02
 d14:	21 15       	cp	r18, r1
 d16:	31 05       	cpc	r19, r1
 d18:	29 f4       	brne	.+10     	; 0xd24 <free+0x9c>
 d1a:	f0 93 6e 01 	sts	0x016E, r31
 d1e:	e0 93 6d 01 	sts	0x016D, r30
 d22:	3e c0       	rjmp	.+124    	; 0xda0 <free+0x118>
 d24:	d9 01       	movw	r26, r18
 d26:	13 96       	adiw	r26, 0x03	; 3
 d28:	fc 93       	st	X, r31
 d2a:	ee 93       	st	-X, r30
 d2c:	12 97       	sbiw	r26, 0x02	; 2
 d2e:	4d 91       	ld	r20, X+
 d30:	5d 91       	ld	r21, X+
 d32:	a4 0f       	add	r26, r20
 d34:	b5 1f       	adc	r27, r21
 d36:	ea 17       	cp	r30, r26
 d38:	fb 07       	cpc	r31, r27
 d3a:	79 f4       	brne	.+30     	; 0xd5a <free+0xd2>
 d3c:	80 81       	ld	r24, Z
 d3e:	91 81       	ldd	r25, Z+1	; 0x01
 d40:	84 0f       	add	r24, r20
 d42:	95 1f       	adc	r25, r21
 d44:	02 96       	adiw	r24, 0x02	; 2
 d46:	d9 01       	movw	r26, r18
 d48:	11 96       	adiw	r26, 0x01	; 1
 d4a:	9c 93       	st	X, r25
 d4c:	8e 93       	st	-X, r24
 d4e:	82 81       	ldd	r24, Z+2	; 0x02
 d50:	93 81       	ldd	r25, Z+3	; 0x03
 d52:	13 96       	adiw	r26, 0x03	; 3
 d54:	9c 93       	st	X, r25
 d56:	8e 93       	st	-X, r24
 d58:	12 97       	sbiw	r26, 0x02	; 2
 d5a:	e0 e0       	ldi	r30, 0x00	; 0
 d5c:	f0 e0       	ldi	r31, 0x00	; 0
 d5e:	8a 81       	ldd	r24, Y+2	; 0x02
 d60:	9b 81       	ldd	r25, Y+3	; 0x03
 d62:	00 97       	sbiw	r24, 0x00	; 0
 d64:	19 f0       	breq	.+6      	; 0xd6c <free+0xe4>
 d66:	fe 01       	movw	r30, r28
 d68:	ec 01       	movw	r28, r24
 d6a:	f9 cf       	rjmp	.-14     	; 0xd5e <free+0xd6>
 d6c:	ce 01       	movw	r24, r28
 d6e:	02 96       	adiw	r24, 0x02	; 2
 d70:	28 81       	ld	r18, Y
 d72:	39 81       	ldd	r19, Y+1	; 0x01
 d74:	82 0f       	add	r24, r18
 d76:	93 1f       	adc	r25, r19
 d78:	20 91 6b 01 	lds	r18, 0x016B
 d7c:	30 91 6c 01 	lds	r19, 0x016C
 d80:	28 17       	cp	r18, r24
 d82:	39 07       	cpc	r19, r25
 d84:	69 f4       	brne	.+26     	; 0xda0 <free+0x118>
 d86:	30 97       	sbiw	r30, 0x00	; 0
 d88:	29 f4       	brne	.+10     	; 0xd94 <free+0x10c>
 d8a:	10 92 6e 01 	sts	0x016E, r1
 d8e:	10 92 6d 01 	sts	0x016D, r1
 d92:	02 c0       	rjmp	.+4      	; 0xd98 <free+0x110>
 d94:	13 82       	std	Z+3, r1	; 0x03
 d96:	12 82       	std	Z+2, r1	; 0x02
 d98:	d0 93 6c 01 	sts	0x016C, r29
 d9c:	c0 93 6b 01 	sts	0x016B, r28
 da0:	df 91       	pop	r29
 da2:	cf 91       	pop	r28
 da4:	08 95       	ret

00000da6 <__eerd_block_m48>:
 da6:	dc 01       	movw	r26, r24
 da8:	86 2f       	mov	r24, r22

00000daa <__eerd_blraw_m48>:
 daa:	e8 2f       	mov	r30, r24
 dac:	f9 99       	sbic	0x1f, 1	; 31
 dae:	fe cf       	rjmp	.-4      	; 0xdac <__eerd_blraw_m48+0x2>
 db0:	12 bc       	out	0x22, r1	; 34
 db2:	05 c0       	rjmp	.+10     	; 0xdbe <__eerd_blraw_m48+0x14>
 db4:	e1 bd       	out	0x21, r30	; 33
 db6:	f8 9a       	sbi	0x1f, 0	; 31
 db8:	e3 95       	inc	r30
 dba:	00 b4       	in	r0, 0x20	; 32
 dbc:	0d 92       	st	X+, r0
 dbe:	41 50       	subi	r20, 0x01	; 1
 dc0:	c8 f7       	brcc	.-14     	; 0xdb4 <__eerd_blraw_m48+0xa>
 dc2:	08 95       	ret

00000dc4 <__eewr_block_m48>:
 dc4:	dc 01       	movw	r26, r24
 dc6:	86 2f       	mov	r24, r22
 dc8:	02 c0       	rjmp	.+4      	; 0xdce <__eewr_block_m48+0xa>
 dca:	2d 91       	ld	r18, X+
 dcc:	04 d0       	rcall	.+8      	; 0xdd6 <__eewr_r18_m48>
 dce:	41 50       	subi	r20, 0x01	; 1
 dd0:	e0 f7       	brcc	.-8      	; 0xdca <__eewr_block_m48+0x6>
 dd2:	08 95       	ret

00000dd4 <__eewr_byte_m48>:
 dd4:	26 2f       	mov	r18, r22

00000dd6 <__eewr_r18_m48>:
 dd6:	f9 99       	sbic	0x1f, 1	; 31
 dd8:	fe cf       	rjmp	.-4      	; 0xdd6 <__eewr_r18_m48>
 dda:	1f ba       	out	0x1f, r1	; 31
 ddc:	12 bc       	out	0x22, r1	; 34
 dde:	81 bd       	out	0x21, r24	; 33
 de0:	20 bd       	out	0x20, r18	; 32
 de2:	0f b6       	in	r0, 0x3f	; 63
 de4:	f8 94       	cli
 de6:	fa 9a       	sbi	0x1f, 2	; 31
 de8:	f9 9a       	sbi	0x1f, 1	; 31
 dea:	0f be       	out	0x3f, r0	; 63
 dec:	01 96       	adiw	r24, 0x01	; 1
 dee:	08 95       	ret

00000df0 <_exit>:
 df0:	f8 94       	cli

00000df2 <__stop_program>:
 df2:	ff cf       	rjmp	.-2      	; 0xdf2 <__stop_program>
