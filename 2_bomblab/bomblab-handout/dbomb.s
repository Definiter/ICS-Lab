
bomb:     file format elf64-x86-64


Disassembly of section .init:

0000000000400a60 <_init>:
  400a60:	48 83 ec 08          	sub    $0x8,%rsp
  400a64:	e8 13 02 00 00       	callq  400c7c <call_gmon_start>
  400a69:	e8 a2 02 00 00       	callq  400d10 <frame_dummy>
  400a6e:	e8 ed 17 00 00       	callq  402260 <__do_global_ctors_aux>
  400a73:	48 83 c4 08          	add    $0x8,%rsp
  400a77:	c3                   	retq   

Disassembly of section .plt:

0000000000400a78 <printf@plt-0x10>:
  400a78:	ff 35 92 27 20 00    	pushq  0x202792(%rip)        # 603210 <_GLOBAL_OFFSET_TABLE_+0x8>
  400a7e:	ff 25 94 27 20 00    	jmpq   *0x202794(%rip)        # 603218 <_GLOBAL_OFFSET_TABLE_+0x10>
  400a84:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400a88 <printf@plt>:
  400a88:	ff 25 92 27 20 00    	jmpq   *0x202792(%rip)        # 603220 <_GLOBAL_OFFSET_TABLE_+0x18>
  400a8e:	68 00 00 00 00       	pushq  $0x0
  400a93:	e9 e0 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400a98 <close@plt>:
  400a98:	ff 25 8a 27 20 00    	jmpq   *0x20278a(%rip)        # 603228 <_GLOBAL_OFFSET_TABLE_+0x20>
  400a9e:	68 01 00 00 00       	pushq  $0x1
  400aa3:	e9 d0 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400aa8 <gethostbyname@plt>:
  400aa8:	ff 25 82 27 20 00    	jmpq   *0x202782(%rip)        # 603230 <_GLOBAL_OFFSET_TABLE_+0x28>
  400aae:	68 02 00 00 00       	pushq  $0x2
  400ab3:	e9 c0 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400ab8 <puts@plt>:
  400ab8:	ff 25 7a 27 20 00    	jmpq   *0x20277a(%rip)        # 603238 <_GLOBAL_OFFSET_TABLE_+0x30>
  400abe:	68 03 00 00 00       	pushq  $0x3
  400ac3:	e9 b0 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400ac8 <__isoc99_sscanf@plt>:
  400ac8:	ff 25 72 27 20 00    	jmpq   *0x202772(%rip)        # 603240 <_GLOBAL_OFFSET_TABLE_+0x38>
  400ace:	68 04 00 00 00       	pushq  $0x4
  400ad3:	e9 a0 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400ad8 <exit@plt>:
  400ad8:	ff 25 6a 27 20 00    	jmpq   *0x20276a(%rip)        # 603248 <_GLOBAL_OFFSET_TABLE_+0x40>
  400ade:	68 05 00 00 00       	pushq  $0x5
  400ae3:	e9 90 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400ae8 <strcasecmp@plt>:
  400ae8:	ff 25 62 27 20 00    	jmpq   *0x202762(%rip)        # 603250 <_GLOBAL_OFFSET_TABLE_+0x48>
  400aee:	68 06 00 00 00       	pushq  $0x6
  400af3:	e9 80 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400af8 <read@plt>:
  400af8:	ff 25 5a 27 20 00    	jmpq   *0x20275a(%rip)        # 603258 <_GLOBAL_OFFSET_TABLE_+0x50>
  400afe:	68 07 00 00 00       	pushq  $0x7
  400b03:	e9 70 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400b08 <fopen@plt>:
  400b08:	ff 25 52 27 20 00    	jmpq   *0x202752(%rip)        # 603260 <_GLOBAL_OFFSET_TABLE_+0x58>
  400b0e:	68 08 00 00 00       	pushq  $0x8
  400b13:	e9 60 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400b18 <__libc_start_main@plt>:
  400b18:	ff 25 4a 27 20 00    	jmpq   *0x20274a(%rip)        # 603268 <_GLOBAL_OFFSET_TABLE_+0x60>
  400b1e:	68 09 00 00 00       	pushq  $0x9
  400b23:	e9 50 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400b28 <fgets@plt>:
  400b28:	ff 25 42 27 20 00    	jmpq   *0x202742(%rip)        # 603270 <_GLOBAL_OFFSET_TABLE_+0x68>
  400b2e:	68 0a 00 00 00       	pushq  $0xa
  400b33:	e9 40 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400b38 <bcopy@plt>:
  400b38:	ff 25 3a 27 20 00    	jmpq   *0x20273a(%rip)        # 603278 <_GLOBAL_OFFSET_TABLE_+0x70>
  400b3e:	68 0b 00 00 00       	pushq  $0xb
  400b43:	e9 30 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400b48 <__ctype_b_loc@plt>:
  400b48:	ff 25 32 27 20 00    	jmpq   *0x202732(%rip)        # 603280 <_GLOBAL_OFFSET_TABLE_+0x78>
  400b4e:	68 0c 00 00 00       	pushq  $0xc
  400b53:	e9 20 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400b58 <sprintf@plt>:
  400b58:	ff 25 2a 27 20 00    	jmpq   *0x20272a(%rip)        # 603288 <_GLOBAL_OFFSET_TABLE_+0x80>
  400b5e:	68 0d 00 00 00       	pushq  $0xd
  400b63:	e9 10 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400b68 <sleep@plt>:
  400b68:	ff 25 22 27 20 00    	jmpq   *0x202722(%rip)        # 603290 <_GLOBAL_OFFSET_TABLE_+0x88>
  400b6e:	68 0e 00 00 00       	pushq  $0xe
  400b73:	e9 00 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400b78 <strtol@plt>:
  400b78:	ff 25 1a 27 20 00    	jmpq   *0x20271a(%rip)        # 603298 <_GLOBAL_OFFSET_TABLE_+0x90>
  400b7e:	68 0f 00 00 00       	pushq  $0xf
  400b83:	e9 f0 fe ff ff       	jmpq   400a78 <_init+0x18>

0000000000400b88 <connect@plt>:
  400b88:	ff 25 12 27 20 00    	jmpq   *0x202712(%rip)        # 6032a0 <_GLOBAL_OFFSET_TABLE_+0x98>
  400b8e:	68 10 00 00 00       	pushq  $0x10
  400b93:	e9 e0 fe ff ff       	jmpq   400a78 <_init+0x18>

0000000000400b98 <gethostname@plt>:
  400b98:	ff 25 0a 27 20 00    	jmpq   *0x20270a(%rip)        # 6032a8 <_GLOBAL_OFFSET_TABLE_+0xa0>
  400b9e:	68 11 00 00 00       	pushq  $0x11
  400ba3:	e9 d0 fe ff ff       	jmpq   400a78 <_init+0x18>

0000000000400ba8 <memcpy@plt>:
  400ba8:	ff 25 02 27 20 00    	jmpq   *0x202702(%rip)        # 6032b0 <_GLOBAL_OFFSET_TABLE_+0xa8>
  400bae:	68 12 00 00 00       	pushq  $0x12
  400bb3:	e9 c0 fe ff ff       	jmpq   400a78 <_init+0x18>

0000000000400bb8 <signal@plt>:
  400bb8:	ff 25 fa 26 20 00    	jmpq   *0x2026fa(%rip)        # 6032b8 <_GLOBAL_OFFSET_TABLE_+0xb0>
  400bbe:	68 13 00 00 00       	pushq  $0x13
  400bc3:	e9 b0 fe ff ff       	jmpq   400a78 <_init+0x18>

0000000000400bc8 <socket@plt>:
  400bc8:	ff 25 f2 26 20 00    	jmpq   *0x2026f2(%rip)        # 6032c0 <_GLOBAL_OFFSET_TABLE_+0xb8>
  400bce:	68 14 00 00 00       	pushq  $0x14
  400bd3:	e9 a0 fe ff ff       	jmpq   400a78 <_init+0x18>

0000000000400bd8 <getenv@plt>:
  400bd8:	ff 25 ea 26 20 00    	jmpq   *0x2026ea(%rip)        # 6032c8 <_GLOBAL_OFFSET_TABLE_+0xc0>
  400bde:	68 15 00 00 00       	pushq  $0x15
  400be3:	e9 90 fe ff ff       	jmpq   400a78 <_init+0x18>

0000000000400be8 <alarm@plt>:
  400be8:	ff 25 e2 26 20 00    	jmpq   *0x2026e2(%rip)        # 6032d0 <_GLOBAL_OFFSET_TABLE_+0xc8>
  400bee:	68 16 00 00 00       	pushq  $0x16
  400bf3:	e9 80 fe ff ff       	jmpq   400a78 <_init+0x18>

0000000000400bf8 <__errno_location@plt>:
  400bf8:	ff 25 da 26 20 00    	jmpq   *0x2026da(%rip)        # 6032d8 <_GLOBAL_OFFSET_TABLE_+0xd0>
  400bfe:	68 17 00 00 00       	pushq  $0x17
  400c03:	e9 70 fe ff ff       	jmpq   400a78 <_init+0x18>

0000000000400c08 <strcpy@plt>:
  400c08:	ff 25 d2 26 20 00    	jmpq   *0x2026d2(%rip)        # 6032e0 <_GLOBAL_OFFSET_TABLE_+0xd8>
  400c0e:	68 18 00 00 00       	pushq  $0x18
  400c13:	e9 60 fe ff ff       	jmpq   400a78 <_init+0x18>

0000000000400c18 <fprintf@plt>:
  400c18:	ff 25 ca 26 20 00    	jmpq   *0x2026ca(%rip)        # 6032e8 <_GLOBAL_OFFSET_TABLE_+0xe0>
  400c1e:	68 19 00 00 00       	pushq  $0x19
  400c23:	e9 50 fe ff ff       	jmpq   400a78 <_init+0x18>

0000000000400c28 <write@plt>:
  400c28:	ff 25 c2 26 20 00    	jmpq   *0x2026c2(%rip)        # 6032f0 <_GLOBAL_OFFSET_TABLE_+0xe8>
  400c2e:	68 1a 00 00 00       	pushq  $0x1a
  400c33:	e9 40 fe ff ff       	jmpq   400a78 <_init+0x18>

0000000000400c38 <fflush@plt>:
  400c38:	ff 25 ba 26 20 00    	jmpq   *0x2026ba(%rip)        # 6032f8 <_GLOBAL_OFFSET_TABLE_+0xf0>
  400c3e:	68 1b 00 00 00       	pushq  $0x1b
  400c43:	e9 30 fe ff ff       	jmpq   400a78 <_init+0x18>

Disassembly of section .text:

0000000000400c50 <_start>:
  400c50:	31 ed                	xor    %ebp,%ebp
  400c52:	49 89 d1             	mov    %rdx,%r9
  400c55:	5e                   	pop    %rsi
  400c56:	48 89 e2             	mov    %rsp,%rdx
  400c59:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400c5d:	50                   	push   %rax
  400c5e:	54                   	push   %rsp
  400c5f:	49 c7 c0 c0 21 40 00 	mov    $0x4021c0,%r8
  400c66:	48 c7 c1 d0 21 40 00 	mov    $0x4021d0,%rcx
  400c6d:	48 c7 c7 34 0d 40 00 	mov    $0x400d34,%rdi
  400c74:	e8 9f fe ff ff       	callq  400b18 <__libc_start_main@plt>
  400c79:	f4                   	hlt    
  400c7a:	90                   	nop
  400c7b:	90                   	nop

0000000000400c7c <call_gmon_start>:
  400c7c:	48 83 ec 08          	sub    $0x8,%rsp
  400c80:	48 8b 05 79 25 20 00 	mov    0x202579(%rip),%rax        # 603200 <_DYNAMIC+0x190>
  400c87:	48 85 c0             	test   %rax,%rax
  400c8a:	74 02                	je     400c8e <call_gmon_start+0x12>
  400c8c:	ff d0                	callq  *%rax
  400c8e:	48 83 c4 08          	add    $0x8,%rsp
  400c92:	c3                   	retq   
  400c93:	90                   	nop
  400c94:	90                   	nop
  400c95:	90                   	nop
  400c96:	90                   	nop
  400c97:	90                   	nop
  400c98:	90                   	nop
  400c99:	90                   	nop
  400c9a:	90                   	nop
  400c9b:	90                   	nop
  400c9c:	90                   	nop
  400c9d:	90                   	nop
  400c9e:	90                   	nop
  400c9f:	90                   	nop

0000000000400ca0 <__do_global_dtors_aux>:
  400ca0:	55                   	push   %rbp
  400ca1:	48 89 e5             	mov    %rsp,%rbp
  400ca4:	53                   	push   %rbx
  400ca5:	48 83 ec 08          	sub    $0x8,%rsp
  400ca9:	80 3d 68 2f 20 00 00 	cmpb   $0x0,0x202f68(%rip)        # 603c18 <completed.6347>
  400cb0:	75 4b                	jne    400cfd <__do_global_dtors_aux+0x5d>
  400cb2:	bb 60 30 60 00       	mov    $0x603060,%ebx
  400cb7:	48 8b 05 62 2f 20 00 	mov    0x202f62(%rip),%rax        # 603c20 <dtor_idx.6349>
  400cbe:	48 81 eb 58 30 60 00 	sub    $0x603058,%rbx
  400cc5:	48 c1 fb 03          	sar    $0x3,%rbx
  400cc9:	48 83 eb 01          	sub    $0x1,%rbx
  400ccd:	48 39 d8             	cmp    %rbx,%rax
  400cd0:	73 24                	jae    400cf6 <__do_global_dtors_aux+0x56>
  400cd2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  400cd8:	48 83 c0 01          	add    $0x1,%rax
  400cdc:	48 89 05 3d 2f 20 00 	mov    %rax,0x202f3d(%rip)        # 603c20 <dtor_idx.6349>
  400ce3:	ff 14 c5 58 30 60 00 	callq  *0x603058(,%rax,8)
  400cea:	48 8b 05 2f 2f 20 00 	mov    0x202f2f(%rip),%rax        # 603c20 <dtor_idx.6349>
  400cf1:	48 39 d8             	cmp    %rbx,%rax
  400cf4:	72 e2                	jb     400cd8 <__do_global_dtors_aux+0x38>
  400cf6:	c6 05 1b 2f 20 00 01 	movb   $0x1,0x202f1b(%rip)        # 603c18 <completed.6347>
  400cfd:	48 83 c4 08          	add    $0x8,%rsp
  400d01:	5b                   	pop    %rbx
  400d02:	c9                   	leaveq 
  400d03:	c3                   	retq   
  400d04:	66 66 66 2e 0f 1f 84 	data32 data32 nopw %cs:0x0(%rax,%rax,1)
  400d0b:	00 00 00 00 00 

0000000000400d10 <frame_dummy>:
  400d10:	48 83 3d 50 23 20 00 	cmpq   $0x0,0x202350(%rip)        # 603068 <__JCR_END__>
  400d17:	00 
  400d18:	55                   	push   %rbp
  400d19:	48 89 e5             	mov    %rsp,%rbp
  400d1c:	74 12                	je     400d30 <frame_dummy+0x20>
  400d1e:	b8 00 00 00 00       	mov    $0x0,%eax
  400d23:	48 85 c0             	test   %rax,%rax
  400d26:	74 08                	je     400d30 <frame_dummy+0x20>
  400d28:	bf 68 30 60 00       	mov    $0x603068,%edi
  400d2d:	c9                   	leaveq 
  400d2e:	ff e0                	jmpq   *%rax
  400d30:	c9                   	leaveq 
  400d31:	c3                   	retq   
  400d32:	90                   	nop
  400d33:	90                   	nop

0000000000400d34 <main>:
  400d34:	55                   	push   %rbp
  400d35:	53                   	push   %rbx
  400d36:	48 83 ec 08          	sub    $0x8,%rsp
  400d3a:	48 89 f3             	mov    %rsi,%rbx
  400d3d:	83 ff 01             	cmp    $0x1,%edi
  400d40:	75 10                	jne    400d52 <main+0x1e>
  400d42:	48 8b 05 b7 2e 20 00 	mov    0x202eb7(%rip),%rax        # 603c00 <__bss_start>
  400d49:	48 89 05 e0 2e 20 00 	mov    %rax,0x202ee0(%rip)        # 603c30 <infile>
  400d50:	eb 5a                	jmp    400dac <main+0x78>
  400d52:	83 ff 02             	cmp    $0x2,%edi
  400d55:	75 39                	jne    400d90 <main+0x5c>
  400d57:	48 8d 6e 08          	lea    0x8(%rsi),%rbp
  400d5b:	be d0 22 40 00       	mov    $0x4022d0,%esi
  400d60:	48 8b 7d 00          	mov    0x0(%rbp),%rdi
  400d64:	e8 9f fd ff ff       	callq  400b08 <fopen@plt>
  400d69:	48 89 05 c0 2e 20 00 	mov    %rax,0x202ec0(%rip)        # 603c30 <infile>
  400d70:	48 85 c0             	test   %rax,%rax
  400d73:	75 37                	jne    400dac <main+0x78>
  400d75:	48 8b 55 00          	mov    0x0(%rbp),%rdx
  400d79:	48 8b 33             	mov    (%rbx),%rsi
  400d7c:	bf d2 22 40 00       	mov    $0x4022d2,%edi
  400d81:	e8 02 fd ff ff       	callq  400a88 <printf@plt>
  400d86:	bf 08 00 00 00       	mov    $0x8,%edi
  400d8b:	e8 48 fd ff ff       	callq  400ad8 <exit@plt>
  400d90:	48 8b 36             	mov    (%rsi),%rsi
  400d93:	bf ef 22 40 00       	mov    $0x4022ef,%edi
  400d98:	b8 00 00 00 00       	mov    $0x0,%eax
  400d9d:	e8 e6 fc ff ff       	callq  400a88 <printf@plt>
  400da2:	bf 08 00 00 00       	mov    $0x8,%edi
  400da7:	e8 2c fd ff ff       	callq  400ad8 <exit@plt>
  400dac:	e8 7a 08 00 00       	callq  40162b <initialize_bomb>
  400db1:	bf 58 23 40 00       	mov    $0x402358,%edi
  400db6:	e8 fd fc ff ff       	callq  400ab8 <puts@plt>
  400dbb:	bf 98 23 40 00       	mov    $0x402398,%edi
  400dc0:	e8 f3 fc ff ff       	callq  400ab8 <puts@plt>
  400dc5:	e8 26 07 00 00       	callq  4014f0 <read_line>
  400dca:	48 89 c7             	mov    %rax,%rdi
  400dcd:	e8 21 04 00 00       	callq  4011f3 <phase_1>
  400dd2:	e8 9a 05 00 00       	callq  401371 <phase_defused>
  400dd7:	bf c8 23 40 00       	mov    $0x4023c8,%edi
  400ddc:	e8 d7 fc ff ff       	callq  400ab8 <puts@plt>
  400de1:	e8 0a 07 00 00       	callq  4014f0 <read_line>
  400de6:	48 89 c7             	mov    %rax,%rdi
  400de9:	e8 6c 02 00 00       	callq  40105a <phase_2>
  400dee:	e8 7e 05 00 00       	callq  401371 <phase_defused>
  400df3:	bf 09 23 40 00       	mov    $0x402309,%edi
  400df8:	e8 bb fc ff ff       	callq  400ab8 <puts@plt>
  400dfd:	e8 ee 06 00 00       	callq  4014f0 <read_line>
  400e02:	48 89 c7             	mov    %rax,%rdi
  400e05:	e8 34 03 00 00       	callq  40113e <phase_3>
  400e0a:	e8 62 05 00 00       	callq  401371 <phase_defused>
  400e0f:	bf 27 23 40 00       	mov    $0x402327,%edi
  400e14:	e8 9f fc ff ff       	callq  400ab8 <puts@plt>
  400e19:	e8 d2 06 00 00       	callq  4014f0 <read_line>
  400e1e:	48 89 c7             	mov    %rax,%rdi
  400e21:	e8 bb 02 00 00       	callq  4010e1 <phase_4>
  400e26:	e8 46 05 00 00       	callq  401371 <phase_defused>
  400e2b:	bf f8 23 40 00       	mov    $0x4023f8,%edi
  400e30:	e8 83 fc ff ff       	callq  400ab8 <puts@plt>
  400e35:	e8 b6 06 00 00       	callq  4014f0 <read_line>
  400e3a:	48 89 c7             	mov    %rax,%rdi
  400e3d:	e8 5c 02 00 00       	callq  40109e <phase_5>
  400e42:	e8 2a 05 00 00       	callq  401371 <phase_defused>
  400e47:	bf 36 23 40 00       	mov    $0x402336,%edi
  400e4c:	e8 67 fc ff ff       	callq  400ab8 <puts@plt>
  400e51:	e8 9a 06 00 00       	callq  4014f0 <read_line>
  400e56:	48 89 c7             	mov    %rax,%rdi
  400e59:	e8 dd 00 00 00       	callq  400f3b <phase_6>
  400e5e:	e8 0e 05 00 00       	callq  401371 <phase_defused>
  400e63:	b8 00 00 00 00       	mov    $0x0,%eax
  400e68:	48 83 c4 08          	add    $0x8,%rsp
  400e6c:	5b                   	pop    %rbx
  400e6d:	5d                   	pop    %rbp
  400e6e:	c3                   	retq   
  400e6f:	90                   	nop

0000000000400e70 <func4>:
  400e70:	48 83 ec 08          	sub    $0x8,%rsp
  400e74:	89 d0                	mov    %edx,%eax
  400e76:	29 f0                	sub    %esi,%eax
  400e78:	89 c1                	mov    %eax,%ecx
  400e7a:	c1 e9 1f             	shr    $0x1f,%ecx
  400e7d:	8d 04 01             	lea    (%rcx,%rax,1),%eax
  400e80:	d1 f8                	sar    %eax
  400e82:	8d 0c 30             	lea    (%rax,%rsi,1),%ecx
  400e85:	39 f9                	cmp    %edi,%ecx
  400e87:	7e 0c                	jle    400e95 <func4+0x25>
  400e89:	8d 51 ff             	lea    -0x1(%rcx),%edx
  400e8c:	e8 df ff ff ff       	callq  400e70 <func4>
  400e91:	01 c0                	add    %eax,%eax
  400e93:	eb 15                	jmp    400eaa <func4+0x3a>
  400e95:	b8 00 00 00 00       	mov    $0x0,%eax
  400e9a:	39 f9                	cmp    %edi,%ecx
  400e9c:	7d 0c                	jge    400eaa <func4+0x3a>
  400e9e:	8d 71 01             	lea    0x1(%rcx),%esi
  400ea1:	e8 ca ff ff ff       	callq  400e70 <func4>
  400ea6:	8d 44 00 01          	lea    0x1(%rax,%rax,1),%eax
  400eaa:	48 83 c4 08          	add    $0x8,%rsp
  400eae:	c3                   	retq   

0000000000400eaf <fun7>:
  400eaf:	48 83 ec 08          	sub    $0x8,%rsp
  400eb3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  400eb8:	48 85 ff             	test   %rdi,%rdi
  400ebb:	74 29                	je     400ee6 <fun7+0x37>
  400ebd:	8b 17                	mov    (%rdi),%edx
  400ebf:	39 f2                	cmp    %esi,%edx
  400ec1:	7e 0d                	jle    400ed0 <fun7+0x21>
  400ec3:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
  400ec7:	e8 e3 ff ff ff       	callq  400eaf <fun7>
  400ecc:	01 c0                	add    %eax,%eax
  400ece:	eb 16                	jmp    400ee6 <fun7+0x37>
  400ed0:	b8 00 00 00 00       	mov    $0x0,%eax
  400ed5:	39 f2                	cmp    %esi,%edx
  400ed7:	74 0d                	je     400ee6 <fun7+0x37>
  400ed9:	48 8b 7f 10          	mov    0x10(%rdi),%rdi
  400edd:	e8 cd ff ff ff       	callq  400eaf <fun7>
  400ee2:	8d 44 00 01          	lea    0x1(%rax,%rax,1),%eax
  400ee6:	48 83 c4 08          	add    $0x8,%rsp
  400eea:	c3                   	retq   

0000000000400eeb <secret_phase>:
  400eeb:	53                   	push   %rbx
  400eec:	e8 ff 05 00 00       	callq  4014f0 <read_line>
  400ef1:	ba 0a 00 00 00       	mov    $0xa,%edx
  400ef6:	be 00 00 00 00       	mov    $0x0,%esi
  400efb:	48 89 c7             	mov    %rax,%rdi
  400efe:	e8 75 fc ff ff       	callq  400b78 <strtol@plt>
  400f03:	89 c3                	mov    %eax,%ebx
  400f05:	8d 43 ff             	lea    -0x1(%rbx),%eax
  400f08:	3d e8 03 00 00       	cmp    $0x3e8,%eax
  400f0d:	76 05                	jbe    400f14 <secret_phase+0x29>
  400f0f:	e8 e6 04 00 00       	callq  4013fa <explode_bomb>
  400f14:	89 de                	mov    %ebx,%esi
  400f16:	bf 60 39 60 00       	mov    $0x603960,%edi
  400f1b:	e8 8f ff ff ff       	callq  400eaf <fun7>
  400f20:	83 f8 01             	cmp    $0x1,%eax
  400f23:	74 05                	je     400f2a <secret_phase+0x3f>
  400f25:	e8 d0 04 00 00       	callq  4013fa <explode_bomb>
  400f2a:	bf 20 24 40 00       	mov    $0x402420,%edi
  400f2f:	e8 84 fb ff ff       	callq  400ab8 <puts@plt>
  400f34:	e8 38 04 00 00       	callq  401371 <phase_defused>
  400f39:	5b                   	pop    %rbx
  400f3a:	c3                   	retq   

0000000000400f3b <phase_6>:
  400f3b:	41 55                	push   %r13
  400f3d:	41 54                	push   %r12
  400f3f:	55                   	push   %rbp
  400f40:	53                   	push   %rbx
  400f41:	48 83 ec 58          	sub    $0x58,%rsp
  400f45:	4c 8d 64 24 30       	lea    0x30(%rsp),%r12
  400f4a:	4c 89 e6             	mov    %r12,%rsi
  400f4d:	e8 de 04 00 00       	callq  401430 <read_six_numbers>
  400f52:	4c 89 e5             	mov    %r12,%rbp
  400f55:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  400f5b:	8b 45 00             	mov    0x0(%rbp),%eax
  400f5e:	83 e8 01             	sub    $0x1,%eax
  400f61:	83 f8 05             	cmp    $0x5,%eax
  400f64:	76 05                	jbe    400f6b <phase_6+0x30>
  400f66:	e8 8f 04 00 00       	callq  4013fa <explode_bomb>
  400f6b:	41 83 c5 01          	add    $0x1,%r13d
  400f6f:	41 83 fd 06          	cmp    $0x6,%r13d
  400f73:	74 22                	je     400f97 <phase_6+0x5c>
  400f75:	44 89 eb             	mov    %r13d,%ebx
  400f78:	48 63 c3             	movslq %ebx,%rax
  400f7b:	8b 55 00             	mov    0x0(%rbp),%edx
  400f7e:	3b 54 84 30          	cmp    0x30(%rsp,%rax,4),%edx
  400f82:	75 05                	jne    400f89 <phase_6+0x4e>
  400f84:	e8 71 04 00 00       	callq  4013fa <explode_bomb>
  400f89:	83 c3 01             	add    $0x1,%ebx
  400f8c:	83 fb 05             	cmp    $0x5,%ebx
  400f8f:	7e e7                	jle    400f78 <phase_6+0x3d>
  400f91:	48 83 c5 04          	add    $0x4,%rbp
  400f95:	eb c4                	jmp    400f5b <phase_6+0x20>
  400f97:	48 8d 4c 24 48       	lea    0x48(%rsp),%rcx
  400f9c:	ba 07 00 00 00       	mov    $0x7,%edx
  400fa1:	89 d0                	mov    %edx,%eax
  400fa3:	41 2b 04 24          	sub    (%r12),%eax
  400fa7:	41 89 04 24          	mov    %eax,(%r12)
  400fab:	49 83 c4 04          	add    $0x4,%r12
  400faf:	49 39 cc             	cmp    %rcx,%r12
  400fb2:	75 ed                	jne    400fa1 <phase_6+0x66>
  400fb4:	bb 00 00 00 00       	mov    $0x0,%ebx
  400fb9:	4c 8d 44 24 30       	lea    0x30(%rsp),%r8
  400fbe:	bd 01 00 00 00       	mov    $0x1,%ebp
  400fc3:	be 90 37 60 00       	mov    $0x603790,%esi
  400fc8:	48 89 e7             	mov    %rsp,%rdi
  400fcb:	eb 19                	jmp    400fe6 <phase_6+0xab>
  400fcd:	48 8b 52 08          	mov    0x8(%rdx),%rdx
  400fd1:	83 c0 01             	add    $0x1,%eax
  400fd4:	39 c8                	cmp    %ecx,%eax
  400fd6:	75 f5                	jne    400fcd <phase_6+0x92>
  400fd8:	48 89 14 5f          	mov    %rdx,(%rdi,%rbx,2)
  400fdc:	48 83 c3 04          	add    $0x4,%rbx
  400fe0:	48 83 fb 18          	cmp    $0x18,%rbx
  400fe4:	74 10                	je     400ff6 <phase_6+0xbb>
  400fe6:	41 8b 0c 18          	mov    (%r8,%rbx,1),%ecx
  400fea:	89 e8                	mov    %ebp,%eax
  400fec:	48 89 f2             	mov    %rsi,%rdx
  400fef:	83 f9 01             	cmp    $0x1,%ecx
  400ff2:	7f d9                	jg     400fcd <phase_6+0x92>
  400ff4:	eb e2                	jmp    400fd8 <phase_6+0x9d>
  400ff6:	48 8b 1c 24          	mov    (%rsp),%rbx
  400ffa:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  400fff:	48 89 43 08          	mov    %rax,0x8(%rbx)
  401003:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
  401008:	48 89 50 08          	mov    %rdx,0x8(%rax)
  40100c:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  401011:	48 89 42 08          	mov    %rax,0x8(%rdx)
  401015:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
  40101a:	48 89 50 08          	mov    %rdx,0x8(%rax)
  40101e:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  401023:	48 89 42 08          	mov    %rax,0x8(%rdx)
  401027:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
  40102e:	00 
  40102f:	bd 00 00 00 00       	mov    $0x0,%ebp
  401034:	48 8b 43 08          	mov    0x8(%rbx),%rax
  401038:	8b 13                	mov    (%rbx),%edx
  40103a:	3b 10                	cmp    (%rax),%edx
  40103c:	7d 05                	jge    401043 <phase_6+0x108>
  40103e:	e8 b7 03 00 00       	callq  4013fa <explode_bomb>
  401043:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
  401047:	83 c5 01             	add    $0x1,%ebp
  40104a:	83 fd 05             	cmp    $0x5,%ebp
  40104d:	75 e5                	jne    401034 <phase_6+0xf9>
  40104f:	48 83 c4 58          	add    $0x58,%rsp
  401053:	5b                   	pop    %rbx
  401054:	5d                   	pop    %rbp
  401055:	41 5c                	pop    %r12
  401057:	41 5d                	pop    %r13
  401059:	c3                   	retq   

000000000040105a <phase_2>:
  40105a:	55                   	push   %rbp
  40105b:	53                   	push   %rbx
  40105c:	48 83 ec 28          	sub    $0x28,%rsp
  401060:	48 89 e6             	mov    %rsp,%rsi
  401063:	e8 c8 03 00 00       	callq  401430 <read_six_numbers>
  401068:	83 3c 24 00          	cmpl   $0x0,(%rsp)
  40106c:	79 05                	jns    401073 <phase_2+0x19>
  40106e:	e8 87 03 00 00       	callq  4013fa <explode_bomb>
  401073:	48 8d 5c 24 04       	lea    0x4(%rsp),%rbx
  401078:	bd 01 00 00 00       	mov    $0x1,%ebp
  40107d:	89 e8                	mov    %ebp,%eax
  40107f:	03 43 fc             	add    -0x4(%rbx),%eax
  401082:	39 03                	cmp    %eax,(%rbx)
  401084:	74 05                	je     40108b <phase_2+0x31>
  401086:	e8 6f 03 00 00       	callq  4013fa <explode_bomb>
  40108b:	83 c5 01             	add    $0x1,%ebp
  40108e:	48 83 c3 04          	add    $0x4,%rbx
  401092:	83 fd 06             	cmp    $0x6,%ebp
  401095:	75 e6                	jne    40107d <phase_2+0x23>
  401097:	48 83 c4 28          	add    $0x28,%rsp
  40109b:	5b                   	pop    %rbx
  40109c:	5d                   	pop    %rbp
  40109d:	c3                   	retq   

000000000040109e <phase_5>:
  40109e:	53                   	push   %rbx
  40109f:	48 89 fb             	mov    %rdi,%rbx
  4010a2:	e8 79 01 00 00       	callq  401220 <string_length>
  4010a7:	83 f8 06             	cmp    $0x6,%eax
  4010aa:	74 05                	je     4010b1 <phase_5+0x13>
  4010ac:	e8 49 03 00 00       	callq  4013fa <explode_bomb>
  4010b1:	48 8d 73 06          	lea    0x6(%rbx),%rsi
  4010b5:	b8 00 00 00 00       	mov    $0x0,%eax
  4010ba:	ba c0 24 40 00       	mov    $0x4024c0,%edx
  4010bf:	48 0f be 0b          	movsbq (%rbx),%rcx
  4010c3:	83 e1 0f             	and    $0xf,%ecx
  4010c6:	03 04 8a             	add    (%rdx,%rcx,4),%eax
  4010c9:	48 83 c3 01          	add    $0x1,%rbx
  4010cd:	48 39 f3             	cmp    %rsi,%rbx
  4010d0:	75 ed                	jne    4010bf <phase_5+0x21>
  4010d2:	83 f8 40             	cmp    $0x40,%eax
  4010d5:	74 05                	je     4010dc <phase_5+0x3e>
  4010d7:	e8 1e 03 00 00       	callq  4013fa <explode_bomb>
  4010dc:	5b                   	pop    %rbx
  4010dd:	0f 1f 00             	nopl   (%rax)
  4010e0:	c3                   	retq   

00000000004010e1 <phase_4>:
  4010e1:	48 83 ec 18          	sub    $0x18,%rsp
  4010e5:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
  4010ea:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
  4010ef:	be 6c 25 40 00       	mov    $0x40256c,%esi
  4010f4:	b8 00 00 00 00       	mov    $0x0,%eax
  4010f9:	e8 ca f9 ff ff       	callq  400ac8 <__isoc99_sscanf@plt>
  4010fe:	83 f8 02             	cmp    $0x2,%eax
  401101:	75 0d                	jne    401110 <phase_4+0x2f>
  401103:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  401107:	85 c0                	test   %eax,%eax
  401109:	78 05                	js     401110 <phase_4+0x2f>
  40110b:	83 f8 0e             	cmp    $0xe,%eax
  40110e:	7e 05                	jle    401115 <phase_4+0x34>
  401110:	e8 e5 02 00 00       	callq  4013fa <explode_bomb>
  401115:	ba 0e 00 00 00       	mov    $0xe,%edx
  40111a:	be 00 00 00 00       	mov    $0x0,%esi
  40111f:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
  401123:	e8 48 fd ff ff       	callq  400e70 <func4>
  401128:	83 f8 03             	cmp    $0x3,%eax
  40112b:	75 07                	jne    401134 <phase_4+0x53>
  40112d:	83 7c 24 08 03       	cmpl   $0x3,0x8(%rsp)
  401132:	74 05                	je     401139 <phase_4+0x58>
  401134:	e8 c1 02 00 00       	callq  4013fa <explode_bomb>
  401139:	48 83 c4 18          	add    $0x18,%rsp
  40113d:	c3                   	retq   

000000000040113e <phase_3>:
  40113e:	48 83 ec 18          	sub    $0x18,%rsp
  401142:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
  401147:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
  40114c:	be 6c 25 40 00       	mov    $0x40256c,%esi
  401151:	b8 00 00 00 00       	mov    $0x0,%eax
  401156:	e8 6d f9 ff ff       	callq  400ac8 <__isoc99_sscanf@plt>
  40115b:	83 f8 01             	cmp    $0x1,%eax
  40115e:	7f 05                	jg     401165 <phase_3+0x27>
  401160:	e8 95 02 00 00       	callq  4013fa <explode_bomb>
  401165:	83 7c 24 0c 07       	cmpl   $0x7,0xc(%rsp)
  40116a:	77 66                	ja     4011d2 <phase_3+0x94>
  40116c:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  401170:	ff 24 c5 80 24 40 00 	jmpq   *0x402480(,%rax,8)
  401177:	b8 00 00 00 00       	mov    $0x0,%eax
  40117c:	eb 4d                	jmp    4011cb <phase_3+0x8d>
  40117e:	b8 00 00 00 00       	mov    $0x0,%eax
  401183:	eb 41                	jmp    4011c6 <phase_3+0x88>
  401185:	b8 00 00 00 00       	mov    $0x0,%eax
  40118a:	eb 35                	jmp    4011c1 <phase_3+0x83>
  40118c:	b8 00 00 00 00       	mov    $0x0,%eax
  401191:	eb 29                	jmp    4011bc <phase_3+0x7e>
  401193:	b8 00 00 00 00       	mov    $0x0,%eax
  401198:	eb 1d                	jmp    4011b7 <phase_3+0x79>
  40119a:	b8 00 00 00 00       	mov    $0x0,%eax
  40119f:	eb 11                	jmp    4011b2 <phase_3+0x74>
  4011a1:	b8 95 01 00 00       	mov    $0x195,%eax
  4011a6:	eb 05                	jmp    4011ad <phase_3+0x6f>
  4011a8:	b8 00 00 00 00       	mov    $0x0,%eax
  4011ad:	2d 3e 01 00 00       	sub    $0x13e,%eax
  4011b2:	05 6f 01 00 00       	add    $0x16f,%eax
  4011b7:	2d 3c 03 00 00       	sub    $0x33c,%eax
  4011bc:	05 3c 03 00 00       	add    $0x33c,%eax
  4011c1:	2d 3c 03 00 00       	sub    $0x33c,%eax
  4011c6:	05 3c 03 00 00       	add    $0x33c,%eax
  4011cb:	2d 3c 03 00 00       	sub    $0x33c,%eax
  4011d0:	eb 0a                	jmp    4011dc <phase_3+0x9e>
  4011d2:	e8 23 02 00 00       	callq  4013fa <explode_bomb>
  4011d7:	b8 00 00 00 00       	mov    $0x0,%eax
  4011dc:	83 7c 24 0c 05       	cmpl   $0x5,0xc(%rsp)
  4011e1:	7f 06                	jg     4011e9 <phase_3+0xab>
  4011e3:	3b 44 24 08          	cmp    0x8(%rsp),%eax
  4011e7:	74 05                	je     4011ee <phase_3+0xb0>
  4011e9:	e8 0c 02 00 00       	callq  4013fa <explode_bomb>
  4011ee:	48 83 c4 18          	add    $0x18,%rsp
  4011f2:	c3                   	retq   

00000000004011f3 <phase_1>:
  4011f3:	48 83 ec 08          	sub    $0x8,%rsp
  4011f7:	be 48 24 40 00       	mov    $0x402448,%esi
  4011fc:	e8 3b 00 00 00       	callq  40123c <strings_not_equal>
  401201:	85 c0                	test   %eax,%eax
  401203:	74 05                	je     40120a <phase_1+0x17>
  401205:	e8 f0 01 00 00       	callq  4013fa <explode_bomb>
  40120a:	48 83 c4 08          	add    $0x8,%rsp
  40120e:	66 90                	xchg   %ax,%ax
  401210:	c3                   	retq   
  401211:	90                   	nop
  401212:	90                   	nop
  401213:	90                   	nop
  401214:	90                   	nop
  401215:	90                   	nop
  401216:	90                   	nop
  401217:	90                   	nop
  401218:	90                   	nop
  401219:	90                   	nop
  40121a:	90                   	nop
  40121b:	90                   	nop
  40121c:	90                   	nop
  40121d:	90                   	nop
  40121e:	90                   	nop
  40121f:	90                   	nop

0000000000401220 <string_length>:
  401220:	48 89 fa             	mov    %rdi,%rdx
  401223:	b8 00 00 00 00       	mov    $0x0,%eax
  401228:	80 3f 00             	cmpb   $0x0,(%rdi)
  40122b:	74 0d                	je     40123a <string_length+0x1a>
  40122d:	48 83 c2 01          	add    $0x1,%rdx
  401231:	89 d0                	mov    %edx,%eax
  401233:	29 f8                	sub    %edi,%eax
  401235:	80 3a 00             	cmpb   $0x0,(%rdx)
  401238:	75 f3                	jne    40122d <string_length+0xd>
  40123a:	f3 c3                	repz retq 

000000000040123c <strings_not_equal>:
  40123c:	41 54                	push   %r12
  40123e:	55                   	push   %rbp
  40123f:	53                   	push   %rbx
  401240:	48 89 fb             	mov    %rdi,%rbx
  401243:	48 89 f5             	mov    %rsi,%rbp
  401246:	e8 d5 ff ff ff       	callq  401220 <string_length>
  40124b:	41 89 c4             	mov    %eax,%r12d
  40124e:	48 89 ef             	mov    %rbp,%rdi
  401251:	e8 ca ff ff ff       	callq  401220 <string_length>
  401256:	41 39 c4             	cmp    %eax,%r12d
  401259:	75 26                	jne    401281 <strings_not_equal+0x45>
  40125b:	0f b6 13             	movzbl (%rbx),%edx
  40125e:	84 d2                	test   %dl,%dl
  401260:	74 26                	je     401288 <strings_not_equal+0x4c>
  401262:	48 89 e8             	mov    %rbp,%rax
  401265:	3a 55 00             	cmp    0x0(%rbp),%dl
  401268:	74 0a                	je     401274 <strings_not_equal+0x38>
  40126a:	eb 15                	jmp    401281 <strings_not_equal+0x45>
  40126c:	48 83 c0 01          	add    $0x1,%rax
  401270:	3a 10                	cmp    (%rax),%dl
  401272:	75 0d                	jne    401281 <strings_not_equal+0x45>
  401274:	48 83 c3 01          	add    $0x1,%rbx
  401278:	0f b6 13             	movzbl (%rbx),%edx
  40127b:	84 d2                	test   %dl,%dl
  40127d:	75 ed                	jne    40126c <strings_not_equal+0x30>
  40127f:	eb 07                	jmp    401288 <strings_not_equal+0x4c>
  401281:	b8 01 00 00 00       	mov    $0x1,%eax
  401286:	eb 05                	jmp    40128d <strings_not_equal+0x51>
  401288:	b8 00 00 00 00       	mov    $0x0,%eax
  40128d:	5b                   	pop    %rbx
  40128e:	5d                   	pop    %rbp
  40128f:	41 5c                	pop    %r12
  401291:	c3                   	retq   

0000000000401292 <initialize_bomb_solve>:
  401292:	f3 c3                	repz retq 

0000000000401294 <invalid_phase>:
  401294:	48 83 ec 08          	sub    $0x8,%rsp
  401298:	48 89 fe             	mov    %rdi,%rsi
  40129b:	bf 00 25 40 00       	mov    $0x402500,%edi
  4012a0:	b8 00 00 00 00       	mov    $0x0,%eax
  4012a5:	e8 de f7 ff ff       	callq  400a88 <printf@plt>
  4012aa:	bf 08 00 00 00       	mov    $0x8,%edi
  4012af:	e8 24 f8 ff ff       	callq  400ad8 <exit@plt>

00000000004012b4 <send_msg>:
  4012b4:	53                   	push   %rbx
  4012b5:	48 81 ec 00 40 00 00 	sub    $0x4000,%rsp
  4012bc:	89 fa                	mov    %edi,%edx
  4012be:	44 8b 05 63 29 20 00 	mov    0x202963(%rip),%r8d        # 603c28 <num_input_strings>
  4012c5:	49 63 c0             	movslq %r8d,%rax
  4012c8:	4c 8d 4c 80 fb       	lea    -0x5(%rax,%rax,4),%r9
  4012cd:	49 c1 e1 04          	shl    $0x4,%r9
  4012d1:	49 81 c1 40 3c 60 00 	add    $0x603c40,%r9
  4012d8:	4c 89 cf             	mov    %r9,%rdi
  4012db:	b8 00 00 00 00       	mov    $0x0,%eax
  4012e0:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  4012e7:	f2 ae                	repnz scas %es:(%rdi),%al
  4012e9:	48 f7 d1             	not    %rcx
  4012ec:	48 83 c1 63          	add    $0x63,%rcx
  4012f0:	48 81 f9 00 20 00 00 	cmp    $0x2000,%rcx
  4012f7:	76 14                	jbe    40130d <send_msg+0x59>
  4012f9:	bf 40 26 40 00       	mov    $0x402640,%edi
  4012fe:	e8 85 f7 ff ff       	callq  400a88 <printf@plt>
  401303:	bf 08 00 00 00       	mov    $0x8,%edi
  401308:	e8 cb f7 ff ff       	callq  400ad8 <exit@plt>
  40130d:	85 d2                	test   %edx,%edx
  40130f:	b8 11 25 40 00       	mov    $0x402511,%eax
  401314:	b9 1a 25 40 00       	mov    $0x40251a,%ecx
  401319:	48 0f 44 c8          	cmove  %rax,%rcx
  40131d:	48 8d 9c 24 00 20 00 	lea    0x2000(%rsp),%rbx
  401324:	00 
  401325:	8b 15 f5 1f 20 00    	mov    0x201ff5(%rip),%edx        # 603320 <bomb_id>
  40132b:	be 22 25 40 00       	mov    $0x402522,%esi
  401330:	48 89 df             	mov    %rbx,%rdi
  401333:	b8 00 00 00 00       	mov    $0x0,%eax
  401338:	e8 1b f8 ff ff       	callq  400b58 <sprintf@plt>
  40133d:	48 89 e1             	mov    %rsp,%rcx
  401340:	ba 00 00 00 00       	mov    $0x0,%edx
  401345:	48 89 de             	mov    %rbx,%rsi
  401348:	bf 40 33 60 00       	mov    $0x603340,%edi
  40134d:	e8 d4 0d 00 00       	callq  402126 <driver_post>
  401352:	85 c0                	test   %eax,%eax
  401354:	79 12                	jns    401368 <send_msg+0xb4>
  401356:	48 89 e7             	mov    %rsp,%rdi
  401359:	e8 5a f7 ff ff       	callq  400ab8 <puts@plt>
  40135e:	bf 00 00 00 00       	mov    $0x0,%edi
  401363:	e8 70 f7 ff ff       	callq  400ad8 <exit@plt>
  401368:	48 81 c4 00 40 00 00 	add    $0x4000,%rsp
  40136f:	5b                   	pop    %rbx
  401370:	c3                   	retq   

0000000000401371 <phase_defused>:
  401371:	48 83 ec 68          	sub    $0x68,%rsp
  401375:	bf 01 00 00 00       	mov    $0x1,%edi
  40137a:	e8 35 ff ff ff       	callq  4012b4 <send_msg>
  40137f:	83 3d a2 28 20 00 06 	cmpl   $0x6,0x2028a2(%rip)        # 603c28 <num_input_strings>
  401386:	75 6d                	jne    4013f5 <phase_defused+0x84>
  401388:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
  40138d:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
  401392:	4c 8d 44 24 10       	lea    0x10(%rsp),%r8
  401397:	be 2e 25 40 00       	mov    $0x40252e,%esi
  40139c:	bf 30 3d 60 00       	mov    $0x603d30,%edi
  4013a1:	b8 00 00 00 00       	mov    $0x0,%eax
  4013a6:	e8 1d f7 ff ff       	callq  400ac8 <__isoc99_sscanf@plt>
  4013ab:	83 f8 03             	cmp    $0x3,%eax
  4013ae:	75 31                	jne    4013e1 <phase_defused+0x70>
  4013b0:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  4013b5:	be 37 25 40 00       	mov    $0x402537,%esi
  4013ba:	e8 7d fe ff ff       	callq  40123c <strings_not_equal>
  4013bf:	85 c0                	test   %eax,%eax
  4013c1:	75 1e                	jne    4013e1 <phase_defused+0x70>
  4013c3:	bf 68 26 40 00       	mov    $0x402668,%edi
  4013c8:	e8 eb f6 ff ff       	callq  400ab8 <puts@plt>
  4013cd:	bf 90 26 40 00       	mov    $0x402690,%edi
  4013d2:	e8 e1 f6 ff ff       	callq  400ab8 <puts@plt>
  4013d7:	b8 00 00 00 00       	mov    $0x0,%eax
  4013dc:	e8 0a fb ff ff       	callq  400eeb <secret_phase>
  4013e1:	bf c8 26 40 00       	mov    $0x4026c8,%edi
  4013e6:	e8 cd f6 ff ff       	callq  400ab8 <puts@plt>
  4013eb:	bf f8 26 40 00       	mov    $0x4026f8,%edi
  4013f0:	e8 c3 f6 ff ff       	callq  400ab8 <puts@plt>
  4013f5:	48 83 c4 68          	add    $0x68,%rsp
  4013f9:	c3                   	retq   

00000000004013fa <explode_bomb>:
  4013fa:	48 83 ec 08          	sub    $0x8,%rsp
  4013fe:	bf 40 25 40 00       	mov    $0x402540,%edi
  401403:	e8 b0 f6 ff ff       	callq  400ab8 <puts@plt>
  401408:	bf 49 25 40 00       	mov    $0x402549,%edi
  40140d:	e8 a6 f6 ff ff       	callq  400ab8 <puts@plt>
  401412:	bf 00 00 00 00       	mov    $0x0,%edi
  401417:	e8 98 fe ff ff       	callq  4012b4 <send_msg>
  40141c:	bf 40 27 40 00       	mov    $0x402740,%edi
  401421:	e8 92 f6 ff ff       	callq  400ab8 <puts@plt>
  401426:	bf 08 00 00 00       	mov    $0x8,%edi
  40142b:	e8 a8 f6 ff ff       	callq  400ad8 <exit@plt>

0000000000401430 <read_six_numbers>:
  401430:	48 83 ec 18          	sub    $0x18,%rsp
  401434:	48 89 f2             	mov    %rsi,%rdx
  401437:	48 8d 4e 04          	lea    0x4(%rsi),%rcx
  40143b:	48 8d 46 14          	lea    0x14(%rsi),%rax
  40143f:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  401444:	48 8d 46 10          	lea    0x10(%rsi),%rax
  401448:	48 89 04 24          	mov    %rax,(%rsp)
  40144c:	4c 8d 4e 0c          	lea    0xc(%rsi),%r9
  401450:	4c 8d 46 08          	lea    0x8(%rsi),%r8
  401454:	be 60 25 40 00       	mov    $0x402560,%esi
  401459:	b8 00 00 00 00       	mov    $0x0,%eax
  40145e:	e8 65 f6 ff ff       	callq  400ac8 <__isoc99_sscanf@plt>
  401463:	83 f8 05             	cmp    $0x5,%eax
  401466:	7f 05                	jg     40146d <read_six_numbers+0x3d>
  401468:	e8 8d ff ff ff       	callq  4013fa <explode_bomb>
  40146d:	48 83 c4 18          	add    $0x18,%rsp
  401471:	c3                   	retq   

0000000000401472 <blank_line>:
  401472:	55                   	push   %rbp
  401473:	53                   	push   %rbx
  401474:	48 83 ec 08          	sub    $0x8,%rsp
  401478:	48 89 fd             	mov    %rdi,%rbp
  40147b:	eb 1e                	jmp    40149b <blank_line+0x29>
  40147d:	e8 c6 f6 ff ff       	callq  400b48 <__ctype_b_loc@plt>
  401482:	48 0f be db          	movsbq %bl,%rbx
  401486:	48 8b 00             	mov    (%rax),%rax
  401489:	f6 44 58 01 20       	testb  $0x20,0x1(%rax,%rbx,2)
  40148e:	75 07                	jne    401497 <blank_line+0x25>
  401490:	b8 00 00 00 00       	mov    $0x0,%eax
  401495:	eb 11                	jmp    4014a8 <blank_line+0x36>
  401497:	48 83 c5 01          	add    $0x1,%rbp
  40149b:	0f b6 5d 00          	movzbl 0x0(%rbp),%ebx
  40149f:	84 db                	test   %bl,%bl
  4014a1:	75 da                	jne    40147d <blank_line+0xb>
  4014a3:	b8 01 00 00 00       	mov    $0x1,%eax
  4014a8:	48 83 c4 08          	add    $0x8,%rsp
  4014ac:	5b                   	pop    %rbx
  4014ad:	5d                   	pop    %rbp
  4014ae:	c3                   	retq   

00000000004014af <skip>:
  4014af:	53                   	push   %rbx
  4014b0:	48 63 05 71 27 20 00 	movslq 0x202771(%rip),%rax        # 603c28 <num_input_strings>
  4014b7:	48 8d 3c 80          	lea    (%rax,%rax,4),%rdi
  4014bb:	48 c1 e7 04          	shl    $0x4,%rdi
  4014bf:	48 81 c7 40 3c 60 00 	add    $0x603c40,%rdi
  4014c6:	48 8b 15 63 27 20 00 	mov    0x202763(%rip),%rdx        # 603c30 <infile>
  4014cd:	be 50 00 00 00       	mov    $0x50,%esi
  4014d2:	e8 51 f6 ff ff       	callq  400b28 <fgets@plt>
  4014d7:	48 89 c3             	mov    %rax,%rbx
  4014da:	48 85 c0             	test   %rax,%rax
  4014dd:	74 0c                	je     4014eb <skip+0x3c>
  4014df:	48 89 c7             	mov    %rax,%rdi
  4014e2:	e8 8b ff ff ff       	callq  401472 <blank_line>
  4014e7:	85 c0                	test   %eax,%eax
  4014e9:	75 c5                	jne    4014b0 <skip+0x1>
  4014eb:	48 89 d8             	mov    %rbx,%rax
  4014ee:	5b                   	pop    %rbx
  4014ef:	c3                   	retq   

00000000004014f0 <read_line>:
  4014f0:	55                   	push   %rbp
  4014f1:	53                   	push   %rbx
  4014f2:	48 83 ec 08          	sub    $0x8,%rsp
  4014f6:	b8 00 00 00 00       	mov    $0x0,%eax
  4014fb:	e8 af ff ff ff       	callq  4014af <skip>
  401500:	48 85 c0             	test   %rax,%rax
  401503:	75 6e                	jne    401573 <read_line+0x83>
  401505:	48 8b 05 f4 26 20 00 	mov    0x2026f4(%rip),%rax        # 603c00 <__bss_start>
  40150c:	48 39 05 1d 27 20 00 	cmp    %rax,0x20271d(%rip)        # 603c30 <infile>
  401513:	75 14                	jne    401529 <read_line+0x39>
  401515:	bf 72 25 40 00       	mov    $0x402572,%edi
  40151a:	e8 99 f5 ff ff       	callq  400ab8 <puts@plt>
  40151f:	bf 08 00 00 00       	mov    $0x8,%edi
  401524:	e8 af f5 ff ff       	callq  400ad8 <exit@plt>
  401529:	bf 90 25 40 00       	mov    $0x402590,%edi
  40152e:	e8 a5 f6 ff ff       	callq  400bd8 <getenv@plt>
  401533:	48 85 c0             	test   %rax,%rax
  401536:	74 0a                	je     401542 <read_line+0x52>
  401538:	bf 00 00 00 00       	mov    $0x0,%edi
  40153d:	e8 96 f5 ff ff       	callq  400ad8 <exit@plt>
  401542:	48 8b 05 b7 26 20 00 	mov    0x2026b7(%rip),%rax        # 603c00 <__bss_start>
  401549:	48 89 05 e0 26 20 00 	mov    %rax,0x2026e0(%rip)        # 603c30 <infile>
  401550:	b8 00 00 00 00       	mov    $0x0,%eax
  401555:	e8 55 ff ff ff       	callq  4014af <skip>
  40155a:	48 85 c0             	test   %rax,%rax
  40155d:	75 14                	jne    401573 <read_line+0x83>
  40155f:	bf 72 25 40 00       	mov    $0x402572,%edi
  401564:	e8 4f f5 ff ff       	callq  400ab8 <puts@plt>
  401569:	bf 00 00 00 00       	mov    $0x0,%edi
  40156e:	e8 65 f5 ff ff       	callq  400ad8 <exit@plt>
  401573:	bd 40 3c 60 00       	mov    $0x603c40,%ebp
  401578:	48 63 05 a9 26 20 00 	movslq 0x2026a9(%rip),%rax        # 603c28 <num_input_strings>
  40157f:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  401583:	48 c1 e0 04          	shl    $0x4,%rax
  401587:	48 8d b8 40 3c 60 00 	lea    0x603c40(%rax),%rdi
  40158e:	b8 00 00 00 00       	mov    $0x0,%eax
  401593:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  40159a:	f2 ae                	repnz scas %es:(%rdi),%al
  40159c:	48 f7 d1             	not    %rcx
  40159f:	8d 59 ff             	lea    -0x1(%rcx),%ebx
  4015a2:	83 fb 4e             	cmp    $0x4e,%ebx
  4015a5:	7e 48                	jle    4015ef <read_line+0xff>
  4015a7:	bf 9b 25 40 00       	mov    $0x40259b,%edi
  4015ac:	e8 07 f5 ff ff       	callq  400ab8 <puts@plt>
  4015b1:	8b 05 71 26 20 00    	mov    0x202671(%rip),%eax        # 603c28 <num_input_strings>
  4015b7:	8d 50 01             	lea    0x1(%rax),%edx
  4015ba:	89 15 68 26 20 00    	mov    %edx,0x202668(%rip)        # 603c28 <num_input_strings>
  4015c0:	48 98                	cltq   
  4015c2:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  4015c6:	48 c1 e0 04          	shl    $0x4,%rax
  4015ca:	48 8d 44 05 00       	lea    0x0(%rbp,%rax,1),%rax
  4015cf:	c7 00 2a 2a 2a 74    	movl   $0x742a2a2a,(%rax)
  4015d5:	c7 40 04 72 75 6e 63 	movl   $0x636e7572,0x4(%rax)
  4015dc:	c7 40 08 61 74 65 64 	movl   $0x64657461,0x8(%rax)
  4015e3:	c7 40 0c 2a 2a 2a 00 	movl   $0x2a2a2a,0xc(%rax)
  4015ea:	e8 0b fe ff ff       	callq  4013fa <explode_bomb>
  4015ef:	8b 0d 33 26 20 00    	mov    0x202633(%rip),%ecx        # 603c28 <num_input_strings>
  4015f5:	83 eb 01             	sub    $0x1,%ebx
  4015f8:	48 63 db             	movslq %ebx,%rbx
  4015fb:	48 63 c1             	movslq %ecx,%rax
  4015fe:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
  401605:	00 
  401606:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
  40160a:	48 c1 e6 04          	shl    $0x4,%rsi
  40160e:	c6 84 33 40 3c 60 00 	movb   $0x0,0x603c40(%rbx,%rsi,1)
  401615:	00 
  401616:	83 c1 01             	add    $0x1,%ecx
  401619:	89 0d 09 26 20 00    	mov    %ecx,0x202609(%rip)        # 603c28 <num_input_strings>
  40161f:	48 8d 44 35 00       	lea    0x0(%rbp,%rsi,1),%rax
  401624:	48 83 c4 08          	add    $0x8,%rsp
  401628:	5b                   	pop    %rbx
  401629:	5d                   	pop    %rbp
  40162a:	c3                   	retq   

000000000040162b <initialize_bomb>:
  40162b:	55                   	push   %rbp
  40162c:	53                   	push   %rbx
  40162d:	48 81 ec 48 20 00 00 	sub    $0x2048,%rsp
  401634:	be e8 16 40 00       	mov    $0x4016e8,%esi
  401639:	bf 02 00 00 00       	mov    $0x2,%edi
  40163e:	e8 75 f5 ff ff       	callq  400bb8 <signal@plt>
  401643:	48 8d bc 24 00 20 00 	lea    0x2000(%rsp),%rdi
  40164a:	00 
  40164b:	be 40 00 00 00       	mov    $0x40,%esi
  401650:	e8 43 f5 ff ff       	callq  400b98 <gethostname@plt>
  401655:	85 c0                	test   %eax,%eax
  401657:	75 1b                	jne    401674 <initialize_bomb+0x49>
  401659:	48 8b 3d 20 23 20 00 	mov    0x202320(%rip),%rdi        # 603980 <host_table>
  401660:	bb 88 39 60 00       	mov    $0x603988,%ebx
  401665:	48 8d ac 24 00 20 00 	lea    0x2000(%rsp),%rbp
  40166c:	00 
  40166d:	48 85 ff             	test   %rdi,%rdi
  401670:	75 16                	jne    401688 <initialize_bomb+0x5d>
  401672:	eb 56                	jmp    4016ca <initialize_bomb+0x9f>
  401674:	bf 68 27 40 00       	mov    $0x402768,%edi
  401679:	e8 3a f4 ff ff       	callq  400ab8 <puts@plt>
  40167e:	bf 08 00 00 00       	mov    $0x8,%edi
  401683:	e8 50 f4 ff ff       	callq  400ad8 <exit@plt>
  401688:	48 89 ee             	mov    %rbp,%rsi
  40168b:	e8 58 f4 ff ff       	callq  400ae8 <strcasecmp@plt>
  401690:	85 c0                	test   %eax,%eax
  401692:	74 0e                	je     4016a2 <initialize_bomb+0x77>
  401694:	48 8b 3b             	mov    (%rbx),%rdi
  401697:	48 83 c3 08          	add    $0x8,%rbx
  40169b:	48 85 ff             	test   %rdi,%rdi
  40169e:	75 e8                	jne    401688 <initialize_bomb+0x5d>
  4016a0:	eb 28                	jmp    4016ca <initialize_bomb+0x9f>
  4016a2:	48 89 e7             	mov    %rsp,%rdi
  4016a5:	e8 96 00 00 00       	callq  401740 <init_driver>
  4016aa:	85 c0                	test   %eax,%eax
  4016ac:	79 30                	jns    4016de <initialize_bomb+0xb3>
  4016ae:	48 89 e6             	mov    %rsp,%rsi
  4016b1:	bf b6 25 40 00       	mov    $0x4025b6,%edi
  4016b6:	b8 00 00 00 00       	mov    $0x0,%eax
  4016bb:	e8 c8 f3 ff ff       	callq  400a88 <printf@plt>
  4016c0:	bf 08 00 00 00       	mov    $0x8,%edi
  4016c5:	e8 0e f4 ff ff       	callq  400ad8 <exit@plt>
  4016ca:	bf a0 27 40 00       	mov    $0x4027a0,%edi
  4016cf:	e8 e4 f3 ff ff       	callq  400ab8 <puts@plt>
  4016d4:	bf 08 00 00 00       	mov    $0x8,%edi
  4016d9:	e8 fa f3 ff ff       	callq  400ad8 <exit@plt>
  4016de:	48 81 c4 48 20 00 00 	add    $0x2048,%rsp
  4016e5:	5b                   	pop    %rbx
  4016e6:	5d                   	pop    %rbp
  4016e7:	c3                   	retq   

00000000004016e8 <sig_handler>:
  4016e8:	48 83 ec 08          	sub    $0x8,%rsp
  4016ec:	bf d8 27 40 00       	mov    $0x4027d8,%edi
  4016f1:	e8 c2 f3 ff ff       	callq  400ab8 <puts@plt>
  4016f6:	bf 03 00 00 00       	mov    $0x3,%edi
  4016fb:	e8 68 f4 ff ff       	callq  400b68 <sleep@plt>
  401700:	bf d0 25 40 00       	mov    $0x4025d0,%edi
  401705:	b8 00 00 00 00       	mov    $0x0,%eax
  40170a:	e8 79 f3 ff ff       	callq  400a88 <printf@plt>
  40170f:	48 8b 3d fa 24 20 00 	mov    0x2024fa(%rip),%rdi        # 603c10 <stdout@@GLIBC_2.2.5>
  401716:	e8 1d f5 ff ff       	callq  400c38 <fflush@plt>
  40171b:	bf 01 00 00 00       	mov    $0x1,%edi
  401720:	e8 43 f4 ff ff       	callq  400b68 <sleep@plt>
  401725:	bf d8 25 40 00       	mov    $0x4025d8,%edi
  40172a:	e8 89 f3 ff ff       	callq  400ab8 <puts@plt>
  40172f:	bf 10 00 00 00       	mov    $0x10,%edi
  401734:	e8 9f f3 ff ff       	callq  400ad8 <exit@plt>
  401739:	90                   	nop
  40173a:	90                   	nop
  40173b:	90                   	nop
  40173c:	90                   	nop
  40173d:	90                   	nop
  40173e:	90                   	nop
  40173f:	90                   	nop

0000000000401740 <init_driver>:
  401740:	41 54                	push   %r12
  401742:	55                   	push   %rbp
  401743:	53                   	push   %rbx
  401744:	48 83 ec 10          	sub    $0x10,%rsp
  401748:	49 89 fc             	mov    %rdi,%r12
  40174b:	be 01 00 00 00       	mov    $0x1,%esi
  401750:	bf 0d 00 00 00       	mov    $0xd,%edi
  401755:	e8 5e f4 ff ff       	callq  400bb8 <signal@plt>
  40175a:	be 01 00 00 00       	mov    $0x1,%esi
  40175f:	bf 1d 00 00 00       	mov    $0x1d,%edi
  401764:	e8 4f f4 ff ff       	callq  400bb8 <signal@plt>
  401769:	be 01 00 00 00       	mov    $0x1,%esi
  40176e:	bf 1d 00 00 00       	mov    $0x1d,%edi
  401773:	e8 40 f4 ff ff       	callq  400bb8 <signal@plt>
  401778:	ba 00 00 00 00       	mov    $0x0,%edx
  40177d:	be 01 00 00 00       	mov    $0x1,%esi
  401782:	bf 02 00 00 00       	mov    $0x2,%edi
  401787:	e8 3c f4 ff ff       	callq  400bc8 <socket@plt>
  40178c:	89 c5                	mov    %eax,%ebp
  40178e:	85 c0                	test   %eax,%eax
  401790:	79 62                	jns    4017f4 <init_driver+0xb4>
  401792:	41 c7 04 24 45 72 72 	movl   $0x6f727245,(%r12)
  401799:	6f 
  40179a:	41 c7 44 24 04 72 3a 	movl   $0x43203a72,0x4(%r12)
  4017a1:	20 43 
  4017a3:	41 c7 44 24 08 6c 69 	movl   $0x6e65696c,0x8(%r12)
  4017aa:	65 6e 
  4017ac:	41 c7 44 24 0c 74 20 	movl   $0x6e752074,0xc(%r12)
  4017b3:	75 6e 
  4017b5:	41 c7 44 24 10 61 62 	movl   $0x656c6261,0x10(%r12)
  4017bc:	6c 65 
  4017be:	41 c7 44 24 14 20 74 	movl   $0x206f7420,0x14(%r12)
  4017c5:	6f 20 
  4017c7:	41 c7 44 24 18 63 72 	movl   $0x61657263,0x18(%r12)
  4017ce:	65 61 
  4017d0:	41 c7 44 24 1c 74 65 	movl   $0x73206574,0x1c(%r12)
  4017d7:	20 73 
  4017d9:	41 c7 44 24 20 6f 63 	movl   $0x656b636f,0x20(%r12)
  4017e0:	6b 65 
  4017e2:	66 41 c7 44 24 24 74 	movw   $0x74,0x24(%r12)
  4017e9:	00 
  4017ea:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4017ef:	e9 56 01 00 00       	jmpq   40194a <init_driver+0x20a>
  4017f4:	bf 10 28 40 00       	mov    $0x402810,%edi
  4017f9:	e8 aa f2 ff ff       	callq  400aa8 <gethostbyname@plt>
  4017fe:	48 85 c0             	test   %rax,%rax
  401801:	0f 85 81 00 00 00    	jne    401888 <init_driver+0x148>
  401807:	41 c7 04 24 45 72 72 	movl   $0x6f727245,(%r12)
  40180e:	6f 
  40180f:	41 c7 44 24 04 72 3a 	movl   $0x44203a72,0x4(%r12)
  401816:	20 44 
  401818:	41 c7 44 24 08 4e 53 	movl   $0x6920534e,0x8(%r12)
  40181f:	20 69 
  401821:	41 c7 44 24 0c 73 20 	movl   $0x6e752073,0xc(%r12)
  401828:	75 6e 
  40182a:	41 c7 44 24 10 61 62 	movl   $0x656c6261,0x10(%r12)
  401831:	6c 65 
  401833:	41 c7 44 24 14 20 74 	movl   $0x206f7420,0x14(%r12)
  40183a:	6f 20 
  40183c:	41 c7 44 24 18 72 65 	movl   $0x6f736572,0x18(%r12)
  401843:	73 6f 
  401845:	41 c7 44 24 1c 6c 76 	movl   $0x2065766c,0x1c(%r12)
  40184c:	65 20 
  40184e:	41 c7 44 24 20 73 65 	movl   $0x76726573,0x20(%r12)
  401855:	72 76 
  401857:	41 c7 44 24 24 65 72 	movl   $0x61207265,0x24(%r12)
  40185e:	20 61 
  401860:	41 c7 44 24 28 64 64 	movl   $0x65726464,0x28(%r12)
  401867:	72 65 
  401869:	66 41 c7 44 24 2c 73 	movw   $0x7373,0x2c(%r12)
  401870:	73 
  401871:	41 c6 44 24 2e 00    	movb   $0x0,0x2e(%r12)
  401877:	89 ef                	mov    %ebp,%edi
  401879:	e8 1a f2 ff ff       	callq  400a98 <close@plt>
  40187e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401883:	e9 c2 00 00 00       	jmpq   40194a <init_driver+0x20a>
  401888:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  40188f:	00 
  401890:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  401897:	00 00 
  401899:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  40189f:	48 63 50 14          	movslq 0x14(%rax),%rdx
  4018a3:	48 8d 74 24 04       	lea    0x4(%rsp),%rsi
  4018a8:	48 8b 40 18          	mov    0x18(%rax),%rax
  4018ac:	48 8b 38             	mov    (%rax),%rdi
  4018af:	e8 84 f2 ff ff       	callq  400b38 <bcopy@plt>
  4018b4:	66 c7 44 24 02 00 51 	movw   $0x5100,0x2(%rsp)
  4018bb:	ba 10 00 00 00       	mov    $0x10,%edx
  4018c0:	48 89 e6             	mov    %rsp,%rsi
  4018c3:	89 ef                	mov    %ebp,%edi
  4018c5:	e8 be f2 ff ff       	callq  400b88 <connect@plt>
  4018ca:	85 c0                	test   %eax,%eax
  4018cc:	79 63                	jns    401931 <init_driver+0x1f1>
  4018ce:	41 c7 04 24 45 72 72 	movl   $0x6f727245,(%r12)
  4018d5:	6f 
  4018d6:	41 c7 44 24 04 72 3a 	movl   $0x55203a72,0x4(%r12)
  4018dd:	20 55 
  4018df:	41 c7 44 24 08 6e 61 	movl   $0x6c62616e,0x8(%r12)
  4018e6:	62 6c 
  4018e8:	41 c7 44 24 0c 65 20 	movl   $0x6f742065,0xc(%r12)
  4018ef:	74 6f 
  4018f1:	41 c7 44 24 10 20 63 	movl   $0x6e6f6320,0x10(%r12)
  4018f8:	6f 6e 
  4018fa:	41 c7 44 24 14 6e 65 	movl   $0x7463656e,0x14(%r12)
  401901:	63 74 
  401903:	41 c7 44 24 18 20 74 	movl   $0x206f7420,0x18(%r12)
  40190a:	6f 20 
  40190c:	41 c7 44 24 1c 73 65 	movl   $0x76726573,0x1c(%r12)
  401913:	72 76 
  401915:	66 41 c7 44 24 20 65 	movw   $0x7265,0x20(%r12)
  40191c:	72 
  40191d:	41 c6 44 24 22 00    	movb   $0x0,0x22(%r12)
  401923:	89 ef                	mov    %ebp,%edi
  401925:	e8 6e f1 ff ff       	callq  400a98 <close@plt>
  40192a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40192f:	eb 19                	jmp    40194a <init_driver+0x20a>
  401931:	89 ef                	mov    %ebp,%edi
  401933:	e8 60 f1 ff ff       	callq  400a98 <close@plt>
  401938:	66 41 c7 04 24 4f 4b 	movw   $0x4b4f,(%r12)
  40193f:	41 c6 44 24 02 00    	movb   $0x0,0x2(%r12)
  401945:	b8 00 00 00 00       	mov    $0x0,%eax
  40194a:	48 83 c4 10          	add    $0x10,%rsp
  40194e:	5b                   	pop    %rbx
  40194f:	5d                   	pop    %rbp
  401950:	41 5c                	pop    %r12
  401952:	c3                   	retq   

0000000000401953 <init_timeout>:
  401953:	53                   	push   %rbx
  401954:	89 fb                	mov    %edi,%ebx
  401956:	85 ff                	test   %edi,%edi
  401958:	74 1e                	je     401978 <init_timeout+0x25>
  40195a:	be 95 21 40 00       	mov    $0x402195,%esi
  40195f:	bf 0e 00 00 00       	mov    $0xe,%edi
  401964:	e8 4f f2 ff ff       	callq  400bb8 <signal@plt>
  401969:	85 db                	test   %ebx,%ebx
  40196b:	bf 00 00 00 00       	mov    $0x0,%edi
  401970:	0f 49 fb             	cmovns %ebx,%edi
  401973:	e8 70 f2 ff ff       	callq  400be8 <alarm@plt>
  401978:	5b                   	pop    %rbx
  401979:	c3                   	retq   

000000000040197a <rio_readlineb>:
  40197a:	41 57                	push   %r15
  40197c:	41 56                	push   %r14
  40197e:	41 55                	push   %r13
  401980:	41 54                	push   %r12
  401982:	55                   	push   %rbp
  401983:	53                   	push   %rbx
  401984:	48 83 ec 28          	sub    $0x28,%rsp
  401988:	48 89 fb             	mov    %rdi,%rbx
  40198b:	48 89 14 24          	mov    %rdx,(%rsp)
  40198f:	49 89 f7             	mov    %rsi,%r15
  401992:	48 83 fa 01          	cmp    $0x1,%rdx
  401996:	0f 86 be 00 00 00    	jbe    401a5a <rio_readlineb+0xe0>
  40199c:	4c 8d 6f 10          	lea    0x10(%rdi),%r13
  4019a0:	4d 89 ec             	mov    %r13,%r12
  4019a3:	41 be 01 00 00 00    	mov    $0x1,%r14d
  4019a9:	eb 38                	jmp    4019e3 <rio_readlineb+0x69>
  4019ab:	ba 00 20 00 00       	mov    $0x2000,%edx
  4019b0:	4c 89 ee             	mov    %r13,%rsi
  4019b3:	8b 3b                	mov    (%rbx),%edi
  4019b5:	e8 3e f1 ff ff       	callq  400af8 <read@plt>
  4019ba:	89 43 04             	mov    %eax,0x4(%rbx)
  4019bd:	85 c0                	test   %eax,%eax
  4019bf:	79 16                	jns    4019d7 <rio_readlineb+0x5d>
  4019c1:	e8 32 f2 ff ff       	callq  400bf8 <__errno_location@plt>
  4019c6:	83 38 04             	cmpl   $0x4,(%rax)
  4019c9:	74 18                	je     4019e3 <rio_readlineb+0x69>
  4019cb:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  4019d2:	e9 a4 00 00 00       	jmpq   401a7b <rio_readlineb+0x101>
  4019d7:	85 c0                	test   %eax,%eax
  4019d9:	0f 84 97 00 00 00    	je     401a76 <rio_readlineb+0xfc>
  4019df:	4c 89 63 08          	mov    %r12,0x8(%rbx)
  4019e3:	8b 6b 04             	mov    0x4(%rbx),%ebp
  4019e6:	85 ed                	test   %ebp,%ebp
  4019e8:	7e c1                	jle    4019ab <rio_readlineb+0x31>
  4019ea:	85 ed                	test   %ebp,%ebp
  4019ec:	0f 85 8e 00 00 00    	jne    401a80 <rio_readlineb+0x106>
  4019f2:	48 63 c5             	movslq %ebp,%rax
  4019f5:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  4019fa:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  4019fe:	48 89 c2             	mov    %rax,%rdx
  401a01:	48 8d 7c 24 1f       	lea    0x1f(%rsp),%rdi
  401a06:	e8 9d f1 ff ff       	callq  400ba8 <memcpy@plt>
  401a0b:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  401a10:	48 01 43 08          	add    %rax,0x8(%rbx)
  401a14:	29 6b 04             	sub    %ebp,0x4(%rbx)
  401a17:	89 c2                	mov    %eax,%edx
  401a19:	83 f8 01             	cmp    $0x1,%eax
  401a1c:	75 15                	jne    401a33 <rio_readlineb+0xb9>
  401a1e:	0f b6 44 24 1f       	movzbl 0x1f(%rsp),%eax
  401a23:	41 88 07             	mov    %al,(%r15)
  401a26:	49 83 c7 01          	add    $0x1,%r15
  401a2a:	80 7c 24 1f 0a       	cmpb   $0xa,0x1f(%rsp)
  401a2f:	75 1d                	jne    401a4e <rio_readlineb+0xd4>
  401a31:	eb 2d                	jmp    401a60 <rio_readlineb+0xe6>
  401a33:	4c 89 f1             	mov    %r14,%rcx
  401a36:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  401a3d:	85 d2                	test   %edx,%edx
  401a3f:	75 26                	jne    401a67 <rio_readlineb+0xed>
  401a41:	b8 00 00 00 00       	mov    $0x0,%eax
  401a46:	48 83 f9 01          	cmp    $0x1,%rcx
  401a4a:	75 14                	jne    401a60 <rio_readlineb+0xe6>
  401a4c:	eb 19                	jmp    401a67 <rio_readlineb+0xed>
  401a4e:	49 83 c6 01          	add    $0x1,%r14
  401a52:	4c 39 34 24          	cmp    %r14,(%rsp)
  401a56:	77 8b                	ja     4019e3 <rio_readlineb+0x69>
  401a58:	eb 06                	jmp    401a60 <rio_readlineb+0xe6>
  401a5a:	41 be 01 00 00 00    	mov    $0x1,%r14d
  401a60:	41 c6 07 00          	movb   $0x0,(%r15)
  401a64:	4c 89 f0             	mov    %r14,%rax
  401a67:	48 83 c4 28          	add    $0x28,%rsp
  401a6b:	5b                   	pop    %rbx
  401a6c:	5d                   	pop    %rbp
  401a6d:	41 5c                	pop    %r12
  401a6f:	41 5d                	pop    %r13
  401a71:	41 5e                	pop    %r14
  401a73:	41 5f                	pop    %r15
  401a75:	c3                   	retq   
  401a76:	ba 00 00 00 00       	mov    $0x0,%edx
  401a7b:	4c 89 f1             	mov    %r14,%rcx
  401a7e:	eb b6                	jmp    401a36 <rio_readlineb+0xbc>
  401a80:	48 8b 43 08          	mov    0x8(%rbx),%rax
  401a84:	0f b6 00             	movzbl (%rax),%eax
  401a87:	88 44 24 1f          	mov    %al,0x1f(%rsp)
  401a8b:	48 83 43 08 01       	addq   $0x1,0x8(%rbx)
  401a90:	83 6b 04 01          	subl   $0x1,0x4(%rbx)
  401a94:	eb 88                	jmp    401a1e <rio_readlineb+0xa4>

0000000000401a96 <submitr>:
  401a96:	41 57                	push   %r15
  401a98:	41 56                	push   %r14
  401a9a:	41 55                	push   %r13
  401a9c:	41 54                	push   %r12
  401a9e:	55                   	push   %rbp
  401a9f:	53                   	push   %rbx
  401aa0:	48 81 ec 78 a0 00 00 	sub    $0xa078,%rsp
  401aa7:	49 89 ff             	mov    %rdi,%r15
  401aaa:	41 89 f4             	mov    %esi,%r12d
  401aad:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
  401ab2:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
  401ab7:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
  401abc:	4c 89 cd             	mov    %r9,%rbp
  401abf:	4c 8b b4 24 b0 a0 00 	mov    0xa0b0(%rsp),%r14
  401ac6:	00 
  401ac7:	c7 84 24 4c 20 00 00 	movl   $0x0,0x204c(%rsp)
  401ace:	00 00 00 00 
  401ad2:	ba 00 00 00 00       	mov    $0x0,%edx
  401ad7:	be 01 00 00 00       	mov    $0x1,%esi
  401adc:	bf 02 00 00 00       	mov    $0x2,%edi
  401ae1:	e8 e2 f0 ff ff       	callq  400bc8 <socket@plt>
  401ae6:	41 89 c5             	mov    %eax,%r13d
  401ae9:	85 c0                	test   %eax,%eax
  401aeb:	79 19                	jns    401b06 <submitr+0x70>
  401aed:	be 70 28 40 00       	mov    $0x402870,%esi
  401af2:	b9 26 00 00 00       	mov    $0x26,%ecx
  401af7:	4c 89 f7             	mov    %r14,%rdi
  401afa:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  401afc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401b01:	e9 a2 05 00 00       	jmpq   4020a8 <submitr+0x612>
  401b06:	4c 89 ff             	mov    %r15,%rdi
  401b09:	e8 9a ef ff ff       	callq  400aa8 <gethostbyname@plt>
  401b0e:	48 85 c0             	test   %rax,%rax
  401b11:	75 21                	jne    401b34 <submitr+0x9e>
  401b13:	be 98 28 40 00       	mov    $0x402898,%esi
  401b18:	b9 37 00 00 00       	mov    $0x37,%ecx
  401b1d:	4c 89 f7             	mov    %r14,%rdi
  401b20:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  401b22:	44 89 ef             	mov    %r13d,%edi
  401b25:	e8 6e ef ff ff       	callq  400a98 <close@plt>
  401b2a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401b2f:	e9 74 05 00 00       	jmpq   4020a8 <submitr+0x612>
  401b34:	48 8d 9c 24 60 a0 00 	lea    0xa060(%rsp),%rbx
  401b3b:	00 
  401b3c:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
  401b43:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
  401b4a:	00 
  401b4b:	66 c7 84 24 60 a0 00 	movw   $0x2,0xa060(%rsp)
  401b52:	00 02 00 
  401b55:	48 63 50 14          	movslq 0x14(%rax),%rdx
  401b59:	48 8d 73 04          	lea    0x4(%rbx),%rsi
  401b5d:	48 8b 40 18          	mov    0x18(%rax),%rax
  401b61:	48 8b 38             	mov    (%rax),%rdi
  401b64:	e8 cf ef ff ff       	callq  400b38 <bcopy@plt>
  401b69:	66 41 c1 cc 08       	ror    $0x8,%r12w
  401b6e:	66 44 89 a4 24 62 a0 	mov    %r12w,0xa062(%rsp)
  401b75:	00 00 
  401b77:	ba 10 00 00 00       	mov    $0x10,%edx
  401b7c:	48 89 de             	mov    %rbx,%rsi
  401b7f:	44 89 ef             	mov    %r13d,%edi
  401b82:	e8 01 f0 ff ff       	callq  400b88 <connect@plt>
  401b87:	85 c0                	test   %eax,%eax
  401b89:	79 21                	jns    401bac <submitr+0x116>
  401b8b:	be d0 28 40 00       	mov    $0x4028d0,%esi
  401b90:	b9 2f 00 00 00       	mov    $0x2f,%ecx
  401b95:	4c 89 f7             	mov    %r14,%rdi
  401b98:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  401b9a:	44 89 ef             	mov    %r13d,%edi
  401b9d:	e8 f6 ee ff ff       	callq  400a98 <close@plt>
  401ba2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401ba7:	e9 fc 04 00 00       	jmpq   4020a8 <submitr+0x612>
  401bac:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  401bb3:	48 89 ef             	mov    %rbp,%rdi
  401bb6:	b8 00 00 00 00       	mov    $0x0,%eax
  401bbb:	48 89 d1             	mov    %rdx,%rcx
  401bbe:	f2 ae                	repnz scas %es:(%rdi),%al
  401bc0:	48 89 cb             	mov    %rcx,%rbx
  401bc3:	48 f7 d3             	not    %rbx
  401bc6:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
  401bcb:	48 89 d1             	mov    %rdx,%rcx
  401bce:	f2 ae                	repnz scas %es:(%rdi),%al
  401bd0:	48 89 ce             	mov    %rcx,%rsi
  401bd3:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
  401bd8:	48 89 d1             	mov    %rdx,%rcx
  401bdb:	f2 ae                	repnz scas %es:(%rdi),%al
  401bdd:	49 89 c8             	mov    %rcx,%r8
  401be0:	49 f7 d0             	not    %r8
  401be3:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
  401be8:	48 89 d1             	mov    %rdx,%rcx
  401beb:	f2 ae                	repnz scas %es:(%rdi),%al
  401bed:	49 29 f0             	sub    %rsi,%r8
  401bf0:	49 29 c8             	sub    %rcx,%r8
  401bf3:	48 8d 5c 5b fd       	lea    -0x3(%rbx,%rbx,2),%rbx
  401bf8:	49 8d 44 18 7b       	lea    0x7b(%r8,%rbx,1),%rax
  401bfd:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  401c03:	0f 86 81 00 00 00    	jbe    401c8a <submitr+0x1f4>
  401c09:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  401c10:	41 c7 46 04 72 3a 20 	movl   $0x52203a72,0x4(%r14)
  401c17:	52 
  401c18:	41 c7 46 08 65 73 75 	movl   $0x6c757365,0x8(%r14)
  401c1f:	6c 
  401c20:	41 c7 46 0c 74 20 73 	movl   $0x74732074,0xc(%r14)
  401c27:	74 
  401c28:	41 c7 46 10 72 69 6e 	movl   $0x676e6972,0x10(%r14)
  401c2f:	67 
  401c30:	41 c7 46 14 20 74 6f 	movl   $0x6f6f7420,0x14(%r14)
  401c37:	6f 
  401c38:	41 c7 46 18 20 6c 61 	movl   $0x72616c20,0x18(%r14)
  401c3f:	72 
  401c40:	41 c7 46 1c 67 65 2e 	movl   $0x202e6567,0x1c(%r14)
  401c47:	20 
  401c48:	41 c7 46 20 49 6e 63 	movl   $0x72636e49,0x20(%r14)
  401c4f:	72 
  401c50:	41 c7 46 24 65 61 73 	movl   $0x65736165,0x24(%r14)
  401c57:	65 
  401c58:	41 c7 46 28 20 53 55 	movl   $0x42555320,0x28(%r14)
  401c5f:	42 
  401c60:	41 c7 46 2c 4d 49 54 	movl   $0x5254494d,0x2c(%r14)
  401c67:	52 
  401c68:	41 c7 46 30 5f 4d 41 	movl   $0x58414d5f,0x30(%r14)
  401c6f:	58 
  401c70:	41 c7 46 34 42 55 46 	movl   $0x465542,0x34(%r14)
  401c77:	00 
  401c78:	44 89 ef             	mov    %r13d,%edi
  401c7b:	e8 18 ee ff ff       	callq  400a98 <close@plt>
  401c80:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401c85:	e9 1e 04 00 00       	jmpq   4020a8 <submitr+0x612>
  401c8a:	48 8d 94 24 50 40 00 	lea    0x4050(%rsp),%rdx
  401c91:	00 
  401c92:	b9 00 04 00 00       	mov    $0x400,%ecx
  401c97:	b8 00 00 00 00       	mov    $0x0,%eax
  401c9c:	48 89 d7             	mov    %rdx,%rdi
  401c9f:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  401ca2:	48 89 ef             	mov    %rbp,%rdi
  401ca5:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  401cac:	f2 ae                	repnz scas %es:(%rdi),%al
  401cae:	48 f7 d1             	not    %rcx
  401cb1:	83 e9 01             	sub    $0x1,%ecx
  401cb4:	0f 84 00 04 00 00    	je     4020ba <submitr+0x624>
  401cba:	48 89 d3             	mov    %rdx,%rbx
  401cbd:	44 8d 61 ff          	lea    -0x1(%rcx),%r12d
  401cc1:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
  401cc5:	3c 2a                	cmp    $0x2a,%al
  401cc7:	74 24                	je     401ced <submitr+0x257>
  401cc9:	3c 2d                	cmp    $0x2d,%al
  401ccb:	74 20                	je     401ced <submitr+0x257>
  401ccd:	3c 2e                	cmp    $0x2e,%al
  401ccf:	74 1c                	je     401ced <submitr+0x257>
  401cd1:	3c 5f                	cmp    $0x5f,%al
  401cd3:	74 18                	je     401ced <submitr+0x257>
  401cd5:	8d 50 d0             	lea    -0x30(%rax),%edx
  401cd8:	80 fa 09             	cmp    $0x9,%dl
  401cdb:	76 10                	jbe    401ced <submitr+0x257>
  401cdd:	8d 50 bf             	lea    -0x41(%rax),%edx
  401ce0:	80 fa 19             	cmp    $0x19,%dl
  401ce3:	76 08                	jbe    401ced <submitr+0x257>
  401ce5:	8d 50 9f             	lea    -0x61(%rax),%edx
  401ce8:	80 fa 19             	cmp    $0x19,%dl
  401ceb:	77 08                	ja     401cf5 <submitr+0x25f>
  401ced:	88 03                	mov    %al,(%rbx)
  401cef:	48 83 c3 01          	add    $0x1,%rbx
  401cf3:	eb 4b                	jmp    401d40 <submitr+0x2aa>
  401cf5:	3c 20                	cmp    $0x20,%al
  401cf7:	75 09                	jne    401d02 <submitr+0x26c>
  401cf9:	c6 03 2b             	movb   $0x2b,(%rbx)
  401cfc:	48 83 c3 01          	add    $0x1,%rbx
  401d00:	eb 3e                	jmp    401d40 <submitr+0x2aa>
  401d02:	8d 50 e0             	lea    -0x20(%rax),%edx
  401d05:	80 fa 5f             	cmp    $0x5f,%dl
  401d08:	76 04                	jbe    401d0e <submitr+0x278>
  401d0a:	3c 09                	cmp    $0x9,%al
  401d0c:	75 48                	jne    401d56 <submitr+0x2c0>
  401d0e:	0f b6 d0             	movzbl %al,%edx
  401d11:	be 1f 28 40 00       	mov    $0x40281f,%esi
  401d16:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  401d1b:	b8 00 00 00 00       	mov    $0x0,%eax
  401d20:	e8 33 ee ff ff       	callq  400b58 <sprintf@plt>
  401d25:	0f b6 44 24 30       	movzbl 0x30(%rsp),%eax
  401d2a:	88 03                	mov    %al,(%rbx)
  401d2c:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
  401d31:	88 43 01             	mov    %al,0x1(%rbx)
  401d34:	0f b6 44 24 32       	movzbl 0x32(%rsp),%eax
  401d39:	88 43 02             	mov    %al,0x2(%rbx)
  401d3c:	48 83 c3 03          	add    $0x3,%rbx
  401d40:	45 85 e4             	test   %r12d,%r12d
  401d43:	0f 84 71 03 00 00    	je     4020ba <submitr+0x624>
  401d49:	48 83 c5 01          	add    $0x1,%rbp
  401d4d:	41 83 ec 01          	sub    $0x1,%r12d
  401d51:	e9 6b ff ff ff       	jmpq   401cc1 <submitr+0x22b>
  401d56:	be 00 29 40 00       	mov    $0x402900,%esi
  401d5b:	b9 43 00 00 00       	mov    $0x43,%ecx
  401d60:	4c 89 f7             	mov    %r14,%rdi
  401d63:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  401d65:	44 89 ef             	mov    %r13d,%edi
  401d68:	e8 2b ed ff ff       	callq  400a98 <close@plt>
  401d6d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401d72:	e9 31 03 00 00       	jmpq   4020a8 <submitr+0x612>
  401d77:	48 01 c5             	add    %rax,%rbp
  401d7a:	48 89 da             	mov    %rbx,%rdx
  401d7d:	48 89 ee             	mov    %rbp,%rsi
  401d80:	44 89 ef             	mov    %r13d,%edi
  401d83:	e8 a0 ee ff ff       	callq  400c28 <write@plt>
  401d88:	48 85 c0             	test   %rax,%rax
  401d8b:	7f 0d                	jg     401d9a <submitr+0x304>
  401d8d:	e8 66 ee ff ff       	callq  400bf8 <__errno_location@plt>
  401d92:	83 38 04             	cmpl   $0x4,(%rax)
  401d95:	75 0d                	jne    401da4 <submitr+0x30e>
  401d97:	4c 89 f8             	mov    %r15,%rax
  401d9a:	48 29 c3             	sub    %rax,%rbx
  401d9d:	75 d8                	jne    401d77 <submitr+0x2e1>
  401d9f:	4d 85 e4             	test   %r12,%r12
  401da2:	79 5d                	jns    401e01 <submitr+0x36b>
  401da4:	4c 89 f7             	mov    %r14,%rdi
  401da7:	be 48 29 40 00       	mov    $0x402948,%esi
  401dac:	b8 34 00 00 00       	mov    $0x34,%eax
  401db1:	41 f6 c6 01          	test   $0x1,%r14b
  401db5:	74 04                	je     401dbb <submitr+0x325>
  401db7:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
  401db8:	83 e8 01             	sub    $0x1,%eax
  401dbb:	40 f6 c7 02          	test   $0x2,%dil
  401dbf:	74 05                	je     401dc6 <submitr+0x330>
  401dc1:	66 a5                	movsw  %ds:(%rsi),%es:(%rdi)
  401dc3:	83 e8 02             	sub    $0x2,%eax
  401dc6:	89 c1                	mov    %eax,%ecx
  401dc8:	c1 e9 02             	shr    $0x2,%ecx
  401dcb:	89 c9                	mov    %ecx,%ecx
  401dcd:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  401dcf:	ba 00 00 00 00       	mov    $0x0,%edx
  401dd4:	a8 02                	test   $0x2,%al
  401dd6:	74 0c                	je     401de4 <submitr+0x34e>
  401dd8:	0f b7 0c 16          	movzwl (%rsi,%rdx,1),%ecx
  401ddc:	66 89 0c 17          	mov    %cx,(%rdi,%rdx,1)
  401de0:	48 83 c2 02          	add    $0x2,%rdx
  401de4:	a8 01                	test   $0x1,%al
  401de6:	74 07                	je     401def <submitr+0x359>
  401de8:	0f b6 04 16          	movzbl (%rsi,%rdx,1),%eax
  401dec:	88 04 17             	mov    %al,(%rdi,%rdx,1)
  401def:	44 89 ef             	mov    %r13d,%edi
  401df2:	e8 a1 ec ff ff       	callq  400a98 <close@plt>
  401df7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401dfc:	e9 a7 02 00 00       	jmpq   4020a8 <submitr+0x612>
  401e01:	44 89 ac 24 50 80 00 	mov    %r13d,0x8050(%rsp)
  401e08:	00 
  401e09:	c7 84 24 54 80 00 00 	movl   $0x0,0x8054(%rsp)
  401e10:	00 00 00 00 
  401e14:	48 8d bc 24 50 80 00 	lea    0x8050(%rsp),%rdi
  401e1b:	00 
  401e1c:	48 8d 47 10          	lea    0x10(%rdi),%rax
  401e20:	48 89 84 24 58 80 00 	mov    %rax,0x8058(%rsp)
  401e27:	00 
  401e28:	48 8d b4 24 50 60 00 	lea    0x6050(%rsp),%rsi
  401e2f:	00 
  401e30:	ba 00 20 00 00       	mov    $0x2000,%edx
  401e35:	e8 40 fb ff ff       	callq  40197a <rio_readlineb>
  401e3a:	48 85 c0             	test   %rax,%rax
  401e3d:	7f 21                	jg     401e60 <submitr+0x3ca>
  401e3f:	be 80 29 40 00       	mov    $0x402980,%esi
  401e44:	b9 3e 00 00 00       	mov    $0x3e,%ecx
  401e49:	4c 89 f7             	mov    %r14,%rdi
  401e4c:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  401e4e:	44 89 ef             	mov    %r13d,%edi
  401e51:	e8 42 ec ff ff       	callq  400a98 <close@plt>
  401e56:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401e5b:	e9 48 02 00 00       	jmpq   4020a8 <submitr+0x612>
  401e60:	4c 8d bc 24 50 60 00 	lea    0x6050(%rsp),%r15
  401e67:	00 
  401e68:	48 8d 8c 24 4c 20 00 	lea    0x204c(%rsp),%rcx
  401e6f:	00 
  401e70:	48 8d 94 24 50 20 00 	lea    0x2050(%rsp),%rdx
  401e77:	00 
  401e78:	4c 8d 44 24 40       	lea    0x40(%rsp),%r8
  401e7d:	be 26 28 40 00       	mov    $0x402826,%esi
  401e82:	4c 89 ff             	mov    %r15,%rdi
  401e85:	b8 00 00 00 00       	mov    $0x0,%eax
  401e8a:	e8 39 ec ff ff       	callq  400ac8 <__isoc99_sscanf@plt>
  401e8f:	8b 94 24 4c 20 00 00 	mov    0x204c(%rsp),%edx
  401e96:	81 fa c8 00 00 00    	cmp    $0xc8,%edx
  401e9c:	0f 84 c8 00 00 00    	je     401f6a <submitr+0x4d4>
  401ea2:	48 8d 4c 24 40       	lea    0x40(%rsp),%rcx
  401ea7:	be c0 29 40 00       	mov    $0x4029c0,%esi
  401eac:	4c 89 f7             	mov    %r14,%rdi
  401eaf:	b8 00 00 00 00       	mov    $0x0,%eax
  401eb4:	e8 9f ec ff ff       	callq  400b58 <sprintf@plt>
  401eb9:	44 89 ef             	mov    %r13d,%edi
  401ebc:	e8 d7 eb ff ff       	callq  400a98 <close@plt>
  401ec1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401ec6:	e9 dd 01 00 00       	jmpq   4020a8 <submitr+0x612>
  401ecb:	ba 00 20 00 00       	mov    $0x2000,%edx
  401ed0:	48 89 de             	mov    %rbx,%rsi
  401ed3:	4c 89 e7             	mov    %r12,%rdi
  401ed6:	e8 9f fa ff ff       	callq  40197a <rio_readlineb>
  401edb:	48 85 c0             	test   %rax,%rax
  401ede:	0f 8f 9b 00 00 00    	jg     401f7f <submitr+0x4e9>
  401ee4:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  401eeb:	41 c7 46 04 72 3a 20 	movl   $0x43203a72,0x4(%r14)
  401ef2:	43 
  401ef3:	41 c7 46 08 6c 69 65 	movl   $0x6e65696c,0x8(%r14)
  401efa:	6e 
  401efb:	41 c7 46 0c 74 20 75 	movl   $0x6e752074,0xc(%r14)
  401f02:	6e 
  401f03:	41 c7 46 10 61 62 6c 	movl   $0x656c6261,0x10(%r14)
  401f0a:	65 
  401f0b:	41 c7 46 14 20 74 6f 	movl   $0x206f7420,0x14(%r14)
  401f12:	20 
  401f13:	41 c7 46 18 72 65 61 	movl   $0x64616572,0x18(%r14)
  401f1a:	64 
  401f1b:	41 c7 46 1c 20 68 65 	movl   $0x61656820,0x1c(%r14)
  401f22:	61 
  401f23:	41 c7 46 20 64 65 72 	movl   $0x73726564,0x20(%r14)
  401f2a:	73 
  401f2b:	41 c7 46 24 20 66 72 	movl   $0x6f726620,0x24(%r14)
  401f32:	6f 
  401f33:	41 c7 46 28 6d 20 41 	movl   $0x7541206d,0x28(%r14)
  401f3a:	75 
  401f3b:	41 c7 46 2c 74 6f 6c 	movl   $0x616c6f74,0x2c(%r14)
  401f42:	61 
  401f43:	41 c7 46 30 62 20 73 	movl   $0x65732062,0x30(%r14)
  401f4a:	65 
  401f4b:	41 c7 46 34 72 76 65 	movl   $0x72657672,0x34(%r14)
  401f52:	72 
  401f53:	41 c6 46 38 00       	movb   $0x0,0x38(%r14)
  401f58:	44 89 ef             	mov    %r13d,%edi
  401f5b:	e8 38 eb ff ff       	callq  400a98 <close@plt>
  401f60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401f65:	e9 3e 01 00 00       	jmpq   4020a8 <submitr+0x612>
  401f6a:	48 8d 9c 24 50 60 00 	lea    0x6050(%rsp),%rbx
  401f71:	00 
  401f72:	bd 3d 28 40 00       	mov    $0x40283d,%ebp
  401f77:	4c 8d a4 24 50 80 00 	lea    0x8050(%rsp),%r12
  401f7e:	00 
  401f7f:	0f b6 03             	movzbl (%rbx),%eax
  401f82:	3a 45 00             	cmp    0x0(%rbp),%al
  401f85:	0f 85 40 ff ff ff    	jne    401ecb <submitr+0x435>
  401f8b:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  401f8f:	3a 45 01             	cmp    0x1(%rbp),%al
  401f92:	0f 85 33 ff ff ff    	jne    401ecb <submitr+0x435>
  401f98:	0f b6 43 02          	movzbl 0x2(%rbx),%eax
  401f9c:	3a 45 02             	cmp    0x2(%rbp),%al
  401f9f:	0f 85 26 ff ff ff    	jne    401ecb <submitr+0x435>
  401fa5:	48 8d b4 24 50 60 00 	lea    0x6050(%rsp),%rsi
  401fac:	00 
  401fad:	48 8d bc 24 50 80 00 	lea    0x8050(%rsp),%rdi
  401fb4:	00 
  401fb5:	ba 00 20 00 00       	mov    $0x2000,%edx
  401fba:	e8 bb f9 ff ff       	callq  40197a <rio_readlineb>
  401fbf:	48 85 c0             	test   %rax,%rax
  401fc2:	7f 5d                	jg     402021 <submitr+0x58b>
  401fc4:	4c 89 f7             	mov    %r14,%rdi
  401fc7:	be f0 29 40 00       	mov    $0x4029f0,%esi
  401fcc:	b8 40 00 00 00       	mov    $0x40,%eax
  401fd1:	41 f6 c6 01          	test   $0x1,%r14b
  401fd5:	74 04                	je     401fdb <submitr+0x545>
  401fd7:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
  401fd8:	83 e8 01             	sub    $0x1,%eax
  401fdb:	40 f6 c7 02          	test   $0x2,%dil
  401fdf:	74 05                	je     401fe6 <submitr+0x550>
  401fe1:	66 a5                	movsw  %ds:(%rsi),%es:(%rdi)
  401fe3:	83 e8 02             	sub    $0x2,%eax
  401fe6:	89 c1                	mov    %eax,%ecx
  401fe8:	c1 e9 02             	shr    $0x2,%ecx
  401feb:	89 c9                	mov    %ecx,%ecx
  401fed:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  401fef:	ba 00 00 00 00       	mov    $0x0,%edx
  401ff4:	a8 02                	test   $0x2,%al
  401ff6:	74 0c                	je     402004 <submitr+0x56e>
  401ff8:	0f b7 0c 16          	movzwl (%rsi,%rdx,1),%ecx
  401ffc:	66 89 0c 17          	mov    %cx,(%rdi,%rdx,1)
  402000:	48 83 c2 02          	add    $0x2,%rdx
  402004:	a8 01                	test   $0x1,%al
  402006:	74 07                	je     40200f <submitr+0x579>
  402008:	0f b6 04 16          	movzbl (%rsi,%rdx,1),%eax
  40200c:	88 04 17             	mov    %al,(%rdi,%rdx,1)
  40200f:	44 89 ef             	mov    %r13d,%edi
  402012:	e8 81 ea ff ff       	callq  400a98 <close@plt>
  402017:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40201c:	e9 87 00 00 00       	jmpq   4020a8 <submitr+0x612>
  402021:	4c 89 fe             	mov    %r15,%rsi
  402024:	4c 89 f7             	mov    %r14,%rdi
  402027:	e8 dc eb ff ff       	callq  400c08 <strcpy@plt>
  40202c:	44 89 ef             	mov    %r13d,%edi
  40202f:	e8 64 ea ff ff       	callq  400a98 <close@plt>
  402034:	4c 89 f2             	mov    %r14,%rdx
  402037:	41 0f b6 06          	movzbl (%r14),%eax
  40203b:	b9 37 28 40 00       	mov    $0x402837,%ecx
  402040:	0f b6 19             	movzbl (%rcx),%ebx
  402043:	39 d8                	cmp    %ebx,%eax
  402045:	75 1e                	jne    402065 <submitr+0x5cf>
  402047:	41 0f b6 5e 01       	movzbl 0x1(%r14),%ebx
  40204c:	3a 59 01             	cmp    0x1(%rcx),%bl
  40204f:	75 14                	jne    402065 <submitr+0x5cf>
  402051:	41 0f b6 5e 02       	movzbl 0x2(%r14),%ebx
  402056:	3a 59 02             	cmp    0x2(%rcx),%bl
  402059:	75 0a                	jne    402065 <submitr+0x5cf>
  40205b:	41 0f b6 5e 03       	movzbl 0x3(%r14),%ebx
  402060:	3a 59 03             	cmp    0x3(%rcx),%bl
  402063:	74 37                	je     40209c <submitr+0x606>
  402065:	4c 89 f6             	mov    %r14,%rsi
  402068:	bf 3b 28 40 00       	mov    $0x40283b,%edi
  40206d:	b9 05 00 00 00       	mov    $0x5,%ecx
  402072:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  402074:	0f 97 c3             	seta   %bl
  402077:	0f 92 c1             	setb   %cl
  40207a:	38 cb                	cmp    %cl,%bl
  40207c:	74 1e                	je     40209c <submitr+0x606>
  40207e:	b9 40 28 40 00       	mov    $0x402840,%ecx
  402083:	0f b6 19             	movzbl (%rcx),%ebx
  402086:	39 d8                	cmp    %ebx,%eax
  402088:	75 19                	jne    4020a3 <submitr+0x60d>
  40208a:	0f b6 42 01          	movzbl 0x1(%rdx),%eax
  40208e:	3a 41 01             	cmp    0x1(%rcx),%al
  402091:	75 10                	jne    4020a3 <submitr+0x60d>
  402093:	0f b6 42 02          	movzbl 0x2(%rdx),%eax
  402097:	3a 41 02             	cmp    0x2(%rcx),%al
  40209a:	75 07                	jne    4020a3 <submitr+0x60d>
  40209c:	b8 00 00 00 00       	mov    $0x0,%eax
  4020a1:	eb 05                	jmp    4020a8 <submitr+0x612>
  4020a3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4020a8:	48 81 c4 78 a0 00 00 	add    $0xa078,%rsp
  4020af:	5b                   	pop    %rbx
  4020b0:	5d                   	pop    %rbp
  4020b1:	41 5c                	pop    %r12
  4020b3:	41 5d                	pop    %r13
  4020b5:	41 5e                	pop    %r14
  4020b7:	41 5f                	pop    %r15
  4020b9:	c3                   	retq   
  4020ba:	48 8d 9c 24 50 60 00 	lea    0x6050(%rsp),%rbx
  4020c1:	00 
  4020c2:	4c 89 3c 24          	mov    %r15,(%rsp)
  4020c6:	4c 8d 8c 24 50 40 00 	lea    0x4050(%rsp),%r9
  4020cd:	00 
  4020ce:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
  4020d3:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
  4020d8:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
  4020dd:	be 30 2a 40 00       	mov    $0x402a30,%esi
  4020e2:	48 89 df             	mov    %rbx,%rdi
  4020e5:	b8 00 00 00 00       	mov    $0x0,%eax
  4020ea:	e8 69 ea ff ff       	callq  400b58 <sprintf@plt>
  4020ef:	48 89 df             	mov    %rbx,%rdi
  4020f2:	b8 00 00 00 00       	mov    $0x0,%eax
  4020f7:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  4020fe:	f2 ae                	repnz scas %es:(%rdi),%al
  402100:	48 f7 d1             	not    %rcx
  402103:	49 89 cc             	mov    %rcx,%r12
  402106:	49 83 ec 01          	sub    $0x1,%r12
  40210a:	0f 84 f1 fc ff ff    	je     401e01 <submitr+0x36b>
  402110:	4c 89 e3             	mov    %r12,%rbx
  402113:	48 8d ac 24 50 60 00 	lea    0x6050(%rsp),%rbp
  40211a:	00 
  40211b:	41 bf 00 00 00 00    	mov    $0x0,%r15d
  402121:	e9 54 fc ff ff       	jmpq   401d7a <submitr+0x2e4>

0000000000402126 <driver_post>:
  402126:	53                   	push   %rbx
  402127:	48 83 ec 10          	sub    $0x10,%rsp
  40212b:	48 89 cb             	mov    %rcx,%rbx
  40212e:	85 d2                	test   %edx,%edx
  402130:	74 1f                	je     402151 <driver_post+0x2b>
  402132:	bf 43 28 40 00       	mov    $0x402843,%edi
  402137:	b8 00 00 00 00       	mov    $0x0,%eax
  40213c:	e8 47 e9 ff ff       	callq  400a88 <printf@plt>
  402141:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402146:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  40214a:	b8 00 00 00 00       	mov    $0x0,%eax
  40214f:	eb 3e                	jmp    40218f <driver_post+0x69>
  402151:	48 85 ff             	test   %rdi,%rdi
  402154:	74 2b                	je     402181 <driver_post+0x5b>
  402156:	80 3f 00             	cmpb   $0x0,(%rdi)
  402159:	74 26                	je     402181 <driver_post+0x5b>
  40215b:	48 89 0c 24          	mov    %rcx,(%rsp)
  40215f:	49 89 f1             	mov    %rsi,%r9
  402162:	41 b8 5a 28 40 00    	mov    $0x40285a,%r8d
  402168:	48 89 f9             	mov    %rdi,%rcx
  40216b:	ba 62 28 40 00       	mov    $0x402862,%edx
  402170:	be 51 00 00 00       	mov    $0x51,%esi
  402175:	bf 10 28 40 00       	mov    $0x402810,%edi
  40217a:	e8 17 f9 ff ff       	callq  401a96 <submitr>
  40217f:	eb 0e                	jmp    40218f <driver_post+0x69>
  402181:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402186:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  40218a:	b8 00 00 00 00       	mov    $0x0,%eax
  40218f:	48 83 c4 10          	add    $0x10,%rsp
  402193:	5b                   	pop    %rbx
  402194:	c3                   	retq   

0000000000402195 <sigalrm_handler>:
  402195:	48 83 ec 08          	sub    $0x8,%rsp
  402199:	ba 00 00 00 00       	mov    $0x0,%edx
  40219e:	be 90 2a 40 00       	mov    $0x402a90,%esi
  4021a3:	48 8b 3d 5e 1a 20 00 	mov    0x201a5e(%rip),%rdi        # 603c08 <stderr@@GLIBC_2.2.5>
  4021aa:	b8 00 00 00 00       	mov    $0x0,%eax
  4021af:	e8 64 ea ff ff       	callq  400c18 <fprintf@plt>
  4021b4:	bf 01 00 00 00       	mov    $0x1,%edi
  4021b9:	e8 1a e9 ff ff       	callq  400ad8 <exit@plt>
  4021be:	90                   	nop
  4021bf:	90                   	nop

00000000004021c0 <__libc_csu_fini>:
  4021c0:	f3 c3                	repz retq 
  4021c2:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  4021c9:	1f 84 00 00 00 00 00 

00000000004021d0 <__libc_csu_init>:
  4021d0:	48 89 6c 24 d8       	mov    %rbp,-0x28(%rsp)
  4021d5:	4c 89 64 24 e0       	mov    %r12,-0x20(%rsp)
  4021da:	48 8d 2d 63 0e 20 00 	lea    0x200e63(%rip),%rbp        # 603044 <__init_array_end>
  4021e1:	4c 8d 25 5c 0e 20 00 	lea    0x200e5c(%rip),%r12        # 603044 <__init_array_end>
  4021e8:	4c 89 6c 24 e8       	mov    %r13,-0x18(%rsp)
  4021ed:	4c 89 74 24 f0       	mov    %r14,-0x10(%rsp)
  4021f2:	4c 89 7c 24 f8       	mov    %r15,-0x8(%rsp)
  4021f7:	48 89 5c 24 d0       	mov    %rbx,-0x30(%rsp)
  4021fc:	48 83 ec 38          	sub    $0x38,%rsp
  402200:	4c 29 e5             	sub    %r12,%rbp
  402203:	41 89 fd             	mov    %edi,%r13d
  402206:	49 89 f6             	mov    %rsi,%r14
  402209:	48 c1 fd 03          	sar    $0x3,%rbp
  40220d:	49 89 d7             	mov    %rdx,%r15
  402210:	e8 4b e8 ff ff       	callq  400a60 <_init>
  402215:	48 85 ed             	test   %rbp,%rbp
  402218:	74 1c                	je     402236 <__libc_csu_init+0x66>
  40221a:	31 db                	xor    %ebx,%ebx
  40221c:	0f 1f 40 00          	nopl   0x0(%rax)
  402220:	4c 89 fa             	mov    %r15,%rdx
  402223:	4c 89 f6             	mov    %r14,%rsi
  402226:	44 89 ef             	mov    %r13d,%edi
  402229:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40222d:	48 83 c3 01          	add    $0x1,%rbx
  402231:	48 39 eb             	cmp    %rbp,%rbx
  402234:	72 ea                	jb     402220 <__libc_csu_init+0x50>
  402236:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  40223b:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
  402240:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  402245:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
  40224a:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
  40224f:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
  402254:	48 83 c4 38          	add    $0x38,%rsp
  402258:	c3                   	retq   
  402259:	90                   	nop
  40225a:	90                   	nop
  40225b:	90                   	nop
  40225c:	90                   	nop
  40225d:	90                   	nop
  40225e:	90                   	nop
  40225f:	90                   	nop

0000000000402260 <__do_global_ctors_aux>:
  402260:	55                   	push   %rbp
  402261:	48 89 e5             	mov    %rsp,%rbp
  402264:	53                   	push   %rbx
  402265:	48 83 ec 08          	sub    $0x8,%rsp
  402269:	48 8b 05 d8 0d 20 00 	mov    0x200dd8(%rip),%rax        # 603048 <__CTOR_LIST__>
  402270:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
  402274:	74 19                	je     40228f <__do_global_ctors_aux+0x2f>
  402276:	bb 48 30 60 00       	mov    $0x603048,%ebx
  40227b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  402280:	48 83 eb 08          	sub    $0x8,%rbx
  402284:	ff d0                	callq  *%rax
  402286:	48 8b 03             	mov    (%rbx),%rax
  402289:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
  40228d:	75 f1                	jne    402280 <__do_global_ctors_aux+0x20>
  40228f:	48 83 c4 08          	add    $0x8,%rsp
  402293:	5b                   	pop    %rbx
  402294:	c9                   	leaveq 
  402295:	c3                   	retq   
  402296:	90                   	nop
  402297:	90                   	nop

Disassembly of section .fini:

0000000000402298 <_fini>:
  402298:	48 83 ec 08          	sub    $0x8,%rsp
  40229c:	e8 ff e9 ff ff       	callq  400ca0 <__do_global_dtors_aux>
  4022a1:	48 83 c4 08          	add    $0x8,%rsp
  4022a5:	c3                   	retq   
