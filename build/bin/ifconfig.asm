
build/bin/_ifconfig：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <main>:
    exit();
}

int
main(int argc, char *argv[])
{
       0:	f3 0f 1e fb          	endbr32 
       4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       8:	83 e4 f0             	and    $0xfffffff0,%esp
       b:	ff 71 fc             	pushl  -0x4(%ecx)
       e:	55                   	push   %ebp
       f:	89 e5                	mov    %esp,%ebp
      11:	57                   	push   %edi
      12:	56                   	push   %esi
      13:	53                   	push   %ebx
      14:	51                   	push   %ecx
      15:	83 ec 38             	sub    $0x38,%esp
      18:	8b 01                	mov    (%ecx),%eax
      1a:	8b 59 04             	mov    0x4(%ecx),%ebx
    char *s;
    ip_addr_t addr, netmask;
    int prefix = 0;

    if (argc == 1) {
      1d:	83 f8 01             	cmp    $0x1,%eax
      20:	74 18                	je     3a <main+0x3a>
        display_all();
        exit();
    }
    if (argc == 2) {
      22:	83 f8 02             	cmp    $0x2,%eax
      25:	74 6d                	je     94 <main+0x94>
            display_all();
        else
            display(argv[1]);
        exit();
    }
    if (argc == 3) {
      27:	83 f8 03             	cmp    $0x3,%eax
      2a:	0f 84 88 00 00 00    	je     b8 <main+0xb8>
            usage();
        netmask = hton32(0xffffffff << (32 - prefix));
        ifset(argv[1], &addr, &netmask);
        exit();
    }
    if (argc == 5) {
      30:	83 f8 05             	cmp    $0x5,%eax
      33:	74 0f                	je     44 <main+0x44>
            usage();
      35:	e8 56 06 00 00       	call   690 <usage>
        display_all();
      3a:	e8 01 05 00 00       	call   540 <display_all>
        exit();
      3f:	e8 69 0d 00 00       	call   dad <exit>
        if (ip_addr_pton(argv[2], &addr) == -1)
      44:	8d 75 c4             	lea    -0x3c(%ebp),%esi
      47:	51                   	push   %ecx
      48:	51                   	push   %ecx
      49:	56                   	push   %esi
      4a:	ff 73 08             	pushl  0x8(%ebx)
      4d:	e8 de 0c 00 00       	call   d30 <ip_addr_pton>
      52:	83 c4 10             	add    $0x10,%esp
      55:	83 c0 01             	add    $0x1,%eax
      58:	74 db                	je     35 <main+0x35>
            usage();
        if (strcmp(argv[3], "netmask") != 0)
      5a:	52                   	push   %edx
      5b:	52                   	push   %edx
      5c:	68 d9 13 00 00       	push   $0x13d9
      61:	ff 73 0c             	pushl  0xc(%ebx)
      64:	e8 a7 06 00 00       	call   710 <strcmp>
      69:	83 c4 10             	add    $0x10,%esp
      6c:	85 c0                	test   %eax,%eax
      6e:	75 c5                	jne    35 <main+0x35>
            usage();
        if (ip_addr_pton(argv[4], &netmask) == -1)
      70:	8d 7d c8             	lea    -0x38(%ebp),%edi
      73:	50                   	push   %eax
      74:	50                   	push   %eax
      75:	57                   	push   %edi
      76:	ff 73 10             	pushl  0x10(%ebx)
      79:	e8 b2 0c 00 00       	call   d30 <ip_addr_pton>
      7e:	83 c4 10             	add    $0x10,%esp
      81:	83 c0 01             	add    $0x1,%eax
      84:	74 af                	je     35 <main+0x35>
            usage();
        ifset(argv[1], &addr, &netmask);
      86:	8b 43 04             	mov    0x4(%ebx),%eax
      89:	89 f9                	mov    %edi,%ecx
      8b:	89 f2                	mov    %esi,%edx
      8d:	e8 2e 05 00 00       	call   5c0 <ifset>
      92:	eb 1f                	jmp    b3 <main+0xb3>
        if (strcmp(argv[1], "-a") == 0)
      94:	57                   	push   %edi
      95:	57                   	push   %edi
      96:	68 ce 13 00 00       	push   $0x13ce
      9b:	ff 73 04             	pushl  0x4(%ebx)
      9e:	e8 6d 06 00 00       	call   710 <strcmp>
      a3:	83 c4 10             	add    $0x10,%esp
      a6:	85 c0                	test   %eax,%eax
      a8:	0f 85 8f 00 00 00    	jne    13d <main+0x13d>
            display_all();
      ae:	e8 8d 04 00 00       	call   540 <display_all>
        exit();
      b3:	e8 f5 0c 00 00       	call   dad <exit>
        if (strcmp(argv[2], "up") == 0) {
      b8:	56                   	push   %esi
      b9:	56                   	push   %esi
      ba:	68 d1 13 00 00       	push   $0x13d1
      bf:	ff 73 08             	pushl  0x8(%ebx)
      c2:	e8 49 06 00 00       	call   710 <strcmp>
      c7:	83 c4 10             	add    $0x10,%esp
      ca:	85 c0                	test   %eax,%eax
      cc:	75 7c                	jne    14a <main+0x14a>
            ifup(argv[1]);
      ce:	8b 73 04             	mov    0x4(%ebx),%esi
    fd = socket(AF_INET, SOCK_DGRAM, 0);
      d1:	51                   	push   %ecx
      d2:	6a 00                	push   $0x0
      d4:	6a 02                	push   $0x2
      d6:	6a 02                	push   $0x2
      d8:	e8 78 0d 00 00       	call   e55 <socket>
    if (fd == -1)
      dd:	83 c4 10             	add    $0x10,%esp
    fd = socket(AF_INET, SOCK_DGRAM, 0);
      e0:	89 c3                	mov    %eax,%ebx
    if (fd == -1)
      e2:	83 f8 ff             	cmp    $0xffffffff,%eax
      e5:	74 cc                	je     b3 <main+0xb3>
    strcpy(ifr.ifr_name, name);
      e7:	8d 7d c8             	lea    -0x38(%ebp),%edi
      ea:	52                   	push   %edx
      eb:	52                   	push   %edx
      ec:	56                   	push   %esi
      ed:	57                   	push   %edi
      ee:	e8 ed 05 00 00       	call   6e0 <strcpy>
    if (ioctl(fd, SIOCGIFFLAGS, &ifr) == -1) {
      f3:	83 c4 0c             	add    $0xc,%esp
      f6:	57                   	push   %edi
      f7:	68 05 69 20 c0       	push   $0xc0206905
      fc:	53                   	push   %ebx
      fd:	e8 4b 0d 00 00       	call   e4d <ioctl>
     102:	83 c4 10             	add    $0x10,%esp
     105:	83 c0 01             	add    $0x1,%eax
     108:	0f 84 14 01 00 00    	je     222 <main+0x222>
    ifr.ifr_flags |= IFF_UP;
     10e:	66 83 4d d8 01       	orw    $0x1,-0x28(%ebp)
    if (ioctl(fd, SIOCSIFFLAGS, &ifr) == -1) {
     113:	50                   	push   %eax
     114:	57                   	push   %edi
     115:	68 06 69 20 80       	push   $0x80206906
     11a:	53                   	push   %ebx
     11b:	e8 2d 0d 00 00       	call   e4d <ioctl>
     120:	83 c4 10             	add    $0x10,%esp
     123:	83 c0 01             	add    $0x1,%eax
     126:	0f 84 17 01 00 00    	je     243 <main+0x243>
    close(fd);
     12c:	83 ec 0c             	sub    $0xc,%esp
     12f:	53                   	push   %ebx
     130:	e8 a0 0c 00 00       	call   dd5 <close>
     135:	83 c4 10             	add    $0x10,%esp
     138:	e9 76 ff ff ff       	jmp    b3 <main+0xb3>
            display(argv[1]);
     13d:	8b 43 04             	mov    0x4(%ebx),%eax
     140:	e8 2b 01 00 00       	call   270 <display>
        exit();
     145:	e9 69 ff ff ff       	jmp    b3 <main+0xb3>
        if (strcmp(argv[2], "down") == 0) {
     14a:	50                   	push   %eax
     14b:	50                   	push   %eax
     14c:	68 d4 13 00 00       	push   $0x13d4
     151:	ff 73 08             	pushl  0x8(%ebx)
     154:	e8 b7 05 00 00       	call   710 <strcmp>
     159:	83 c4 10             	add    $0x10,%esp
     15c:	85 c0                	test   %eax,%eax
     15e:	74 78                	je     1d8 <main+0x1d8>
        s = strchr(argv[2], '/');
     160:	50                   	push   %eax
     161:	50                   	push   %eax
     162:	6a 2f                	push   $0x2f
     164:	ff 73 08             	pushl  0x8(%ebx)
     167:	e8 54 06 00 00       	call   7c0 <strchr>
        if (!s)
     16c:	83 c4 10             	add    $0x10,%esp
        s = strchr(argv[2], '/');
     16f:	89 c6                	mov    %eax,%esi
        if (!s)
     171:	85 c0                	test   %eax,%eax
     173:	0f 84 bc fe ff ff    	je     35 <main+0x35>
        *s++ = 0;
     179:	c6 00 00             	movb   $0x0,(%eax)
        if (ip_addr_pton(argv[2], &addr) == -1)
     17c:	57                   	push   %edi
     17d:	57                   	push   %edi
     17e:	8d 7d c4             	lea    -0x3c(%ebp),%edi
     181:	57                   	push   %edi
     182:	ff 73 08             	pushl  0x8(%ebx)
     185:	e8 a6 0b 00 00       	call   d30 <ip_addr_pton>
     18a:	83 c4 10             	add    $0x10,%esp
     18d:	83 c0 01             	add    $0x1,%eax
     190:	0f 84 9f fe ff ff    	je     35 <main+0x35>
        prefix = atoi(s);
     196:	83 ec 0c             	sub    $0xc,%esp
        *s++ = 0;
     199:	83 c6 01             	add    $0x1,%esi
        prefix = atoi(s);
     19c:	56                   	push   %esi
     19d:	e8 2e 07 00 00       	call   8d0 <atoi>
        if (prefix < 0 || prefix > 32)
     1a2:	83 c4 10             	add    $0x10,%esp
     1a5:	83 f8 20             	cmp    $0x20,%eax
     1a8:	0f 87 87 fe ff ff    	ja     35 <main+0x35>
        netmask = hton32(0xffffffff << (32 - prefix));
     1ae:	b9 20 00 00 00       	mov    $0x20,%ecx
     1b3:	83 ec 0c             	sub    $0xc,%esp
     1b6:	29 c1                	sub    %eax,%ecx
     1b8:	83 c8 ff             	or     $0xffffffff,%eax
     1bb:	d3 e0                	shl    %cl,%eax
     1bd:	50                   	push   %eax
     1be:	e8 ed 09 00 00       	call   bb0 <hton32>
        ifset(argv[1], &addr, &netmask);
     1c3:	8d 4d c8             	lea    -0x38(%ebp),%ecx
     1c6:	89 fa                	mov    %edi,%edx
        netmask = hton32(0xffffffff << (32 - prefix));
     1c8:	89 45 c8             	mov    %eax,-0x38(%ebp)
        ifset(argv[1], &addr, &netmask);
     1cb:	8b 43 04             	mov    0x4(%ebx),%eax
     1ce:	e8 ed 03 00 00       	call   5c0 <ifset>
        exit();
     1d3:	e8 d5 0b 00 00       	call   dad <exit>
            ifdown(argv[1]);
     1d8:	8b 73 04             	mov    0x4(%ebx),%esi
    fd = socket(AF_INET, SOCK_DGRAM, 0);
     1db:	50                   	push   %eax
     1dc:	6a 00                	push   $0x0
     1de:	6a 02                	push   $0x2
     1e0:	6a 02                	push   $0x2
     1e2:	e8 6e 0c 00 00       	call   e55 <socket>
    if (fd == -1)
     1e7:	83 c4 10             	add    $0x10,%esp
    fd = socket(AF_INET, SOCK_DGRAM, 0);
     1ea:	89 c3                	mov    %eax,%ebx
    if (fd == -1)
     1ec:	83 f8 ff             	cmp    $0xffffffff,%eax
     1ef:	0f 84 be fe ff ff    	je     b3 <main+0xb3>
    strcpy(ifr.ifr_name, name);
     1f5:	8d 7d c8             	lea    -0x38(%ebp),%edi
     1f8:	50                   	push   %eax
     1f9:	50                   	push   %eax
     1fa:	56                   	push   %esi
     1fb:	57                   	push   %edi
     1fc:	e8 df 04 00 00       	call   6e0 <strcpy>
    if (ioctl(fd, SIOCGIFFLAGS, &ifr) == -1) {
     201:	83 c4 0c             	add    $0xc,%esp
     204:	57                   	push   %edi
     205:	68 05 69 20 c0       	push   $0xc0206905
     20a:	53                   	push   %ebx
     20b:	e8 3d 0c 00 00       	call   e4d <ioctl>
     210:	83 c4 10             	add    $0x10,%esp
     213:	83 c0 01             	add    $0x1,%eax
     216:	74 0a                	je     222 <main+0x222>
    ifr.ifr_flags &= ~IFF_UP;
     218:	66 83 65 d8 fe       	andw   $0xfffe,-0x28(%ebp)
     21d:	e9 f1 fe ff ff       	jmp    113 <main+0x113>
        close(fd);
     222:	83 ec 0c             	sub    $0xc,%esp
     225:	53                   	push   %ebx
     226:	e8 aa 0b 00 00       	call   dd5 <close>
        printf(0, "ifconfig: interface %s does not exist\n", name);
     22b:	83 c4 0c             	add    $0xc,%esp
     22e:	56                   	push   %esi
     22f:	68 e4 13 00 00       	push   $0x13e4
     234:	6a 00                	push   $0x0
     236:	e8 15 0d 00 00       	call   f50 <printf>
        return;
     23b:	83 c4 10             	add    $0x10,%esp
     23e:	e9 70 fe ff ff       	jmp    b3 <main+0xb3>
        close(fd);
     243:	83 ec 0c             	sub    $0xc,%esp
     246:	53                   	push   %ebx
     247:	e8 89 0b 00 00       	call   dd5 <close>
        printf(0, "ifconfig: ioctl(SIOCSIFFLAGS) failure, interface=%s\n", name);
     24c:	83 c4 0c             	add    $0xc,%esp
     24f:	56                   	push   %esi
     250:	68 0c 15 00 00       	push   $0x150c
     255:	6a 00                	push   $0x0
     257:	e8 f4 0c 00 00       	call   f50 <printf>
        return;
     25c:	83 c4 10             	add    $0x10,%esp
     25f:	e9 4f fe ff ff       	jmp    b3 <main+0xb3>
     264:	66 90                	xchg   %ax,%ax
     266:	66 90                	xchg   %ax,%ax
     268:	66 90                	xchg   %ax,%ax
     26a:	66 90                	xchg   %ax,%ax
     26c:	66 90                	xchg   %ax,%ax
     26e:	66 90                	xchg   %ax,%ax

00000270 <display>:
{
     270:	55                   	push   %ebp
    char **s, *str[] = {
     271:	b9 11 00 00 00       	mov    $0x11,%ecx
{
     276:	89 e5                	mov    %esp,%ebp
     278:	57                   	push   %edi
     279:	56                   	push   %esi
    char **s, *str[] = {
     27a:	be 60 15 00 00       	mov    $0x1560,%esi
{
     27f:	53                   	push   %ebx
    char **s, *str[] = {
     280:	8d 5d a4             	lea    -0x5c(%ebp),%ebx
     283:	89 df                	mov    %ebx,%edi
{
     285:	81 ec 90 00 00 00    	sub    $0x90,%esp
     28b:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    char **s, *str[] = {
     291:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    fd = socket(AF_INET, SOCK_DGRAM, 0);
     293:	6a 00                	push   $0x0
     295:	6a 02                	push   $0x2
     297:	6a 02                	push   $0x2
     299:	e8 b7 0b 00 00       	call   e55 <socket>
    if (fd == -1)
     29e:	83 c4 10             	add    $0x10,%esp
     2a1:	83 f8 ff             	cmp    $0xffffffff,%eax
     2a4:	0f 84 48 01 00 00    	je     3f2 <display+0x182>
    strcpy(ifr.ifr_name, name);
     2aa:	83 ec 08             	sub    $0x8,%esp
     2ad:	89 c6                	mov    %eax,%esi
     2af:	8d 45 84             	lea    -0x7c(%ebp),%eax
     2b2:	ff b5 74 ff ff ff    	pushl  -0x8c(%ebp)
     2b8:	50                   	push   %eax
     2b9:	e8 22 04 00 00       	call   6e0 <strcpy>
    if (ioctl(fd, SIOCGIFFLAGS, &ifr) == -1) {
     2be:	83 c4 0c             	add    $0xc,%esp
     2c1:	8d 45 84             	lea    -0x7c(%ebp),%eax
     2c4:	50                   	push   %eax
     2c5:	68 05 69 20 c0       	push   $0xc0206905
     2ca:	56                   	push   %esi
     2cb:	e8 7d 0b 00 00       	call   e4d <ioctl>
     2d0:	83 c4 10             	add    $0x10,%esp
     2d3:	83 f8 ff             	cmp    $0xffffffff,%eax
     2d6:	0f 84 34 02 00 00    	je     510 <display+0x2a0>
    printf(0, "%s: ", ifr.ifr_name);
     2dc:	83 ec 04             	sub    $0x4,%esp
     2df:	8d 45 84             	lea    -0x7c(%ebp),%eax
    unsigned short mask = 1;
     2e2:	bf 01 00 00 00       	mov    $0x1,%edi
    printf(0, "%s: ", ifr.ifr_name);
     2e7:	50                   	push   %eax
     2e8:	68 43 13 00 00       	push   $0x1343
     2ed:	6a 00                	push   $0x0
     2ef:	e8 5c 0c 00 00       	call   f50 <printf>
    printf(0, "flags=%x<", ifr.ifr_flags);
     2f4:	0f bf 45 94          	movswl -0x6c(%ebp),%eax
     2f8:	83 c4 0c             	add    $0xc,%esp
     2fb:	50                   	push   %eax
     2fc:	68 48 13 00 00       	push   $0x1348
     301:	6a 00                	push   $0x0
     303:	e8 48 0c 00 00       	call   f50 <printf>
    for (s = str; *s; s++) {
     308:	8b 55 a4             	mov    -0x5c(%ebp),%edx
     30b:	83 c4 10             	add    $0x10,%esp
    int any = 0;
     30e:	31 c9                	xor    %ecx,%ecx
    for (s = str; *s; s++) {
     310:	85 d2                	test   %edx,%edx
     312:	0f 85 29 01 00 00    	jne    441 <display+0x1d1>
     318:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     31f:	90                   	nop
    printf(0, ">");
     320:	83 ec 08             	sub    $0x8,%esp
     323:	68 52 13 00 00       	push   $0x1352
     328:	6a 00                	push   $0x0
     32a:	e8 21 0c 00 00       	call   f50 <printf>
    if (ioctl(fd, SIOCGIFMTU, &ifr) == -1)
     32f:	83 c4 0c             	add    $0xc,%esp
     332:	8d 45 84             	lea    -0x7c(%ebp),%eax
     335:	50                   	push   %eax
     336:	68 0d 69 20 c0       	push   $0xc020690d
     33b:	56                   	push   %esi
     33c:	e8 0c 0b 00 00       	call   e4d <ioctl>
     341:	83 c4 10             	add    $0x10,%esp
     344:	83 f8 ff             	cmp    $0xffffffff,%eax
     347:	0f 84 03 01 00 00    	je     450 <display+0x1e0>
     34d:	8b 45 94             	mov    -0x6c(%ebp),%eax
    printf(0, " mtu %d\n", ifr.ifr_mtu);
     350:	83 ec 04             	sub    $0x4,%esp
     353:	50                   	push   %eax
     354:	68 56 13 00 00       	push   $0x1356
     359:	6a 00                	push   $0x0
     35b:	e8 f0 0b 00 00       	call   f50 <printf>
    if (ioctl(fd, SIOCGIFHWADDR, &ifr) == 0) {
     360:	83 c4 0c             	add    $0xc,%esp
     363:	8d 45 84             	lea    -0x7c(%ebp),%eax
     366:	50                   	push   %eax
     367:	68 03 69 20 c0       	push   $0xc0206903
     36c:	56                   	push   %esi
     36d:	e8 db 0a 00 00       	call   e4d <ioctl>
     372:	83 c4 10             	add    $0x10,%esp
     375:	85 c0                	test   %eax,%eax
     377:	0f 84 5b 01 00 00    	je     4d8 <display+0x268>
        if (ioctl(fd, SIOCGIFADDR, &ifr) == -1)
     37d:	83 ec 04             	sub    $0x4,%esp
     380:	8d 45 84             	lea    -0x7c(%ebp),%eax
        ifr.ifr_addr.sa_family = AF_INET;
     383:	b9 02 00 00 00       	mov    $0x2,%ecx
        if (ioctl(fd, SIOCGIFADDR, &ifr) == -1)
     388:	50                   	push   %eax
     389:	68 07 69 20 c0       	push   $0xc0206907
     38e:	56                   	push   %esi
        ifr.ifr_addr.sa_family = AF_INET;
     38f:	66 89 4d 94          	mov    %cx,-0x6c(%ebp)
        if (ioctl(fd, SIOCGIFADDR, &ifr) == -1)
     393:	e8 b5 0a 00 00       	call   e4d <ioctl>
     398:	83 c4 10             	add    $0x10,%esp
     39b:	83 f8 ff             	cmp    $0xffffffff,%eax
     39e:	74 46                	je     3e6 <display+0x176>
        printf(0, "\tinet %d.%d.%d.%d", p[0], p[1], p[2], p[3]);
     3a0:	0f b6 45 9b          	movzbl -0x65(%ebp),%eax
     3a4:	83 ec 08             	sub    $0x8,%esp
     3a7:	50                   	push   %eax
     3a8:	0f b6 45 9a          	movzbl -0x66(%ebp),%eax
     3ac:	50                   	push   %eax
     3ad:	0f b6 45 99          	movzbl -0x67(%ebp),%eax
     3b1:	50                   	push   %eax
     3b2:	0f b6 45 98          	movzbl -0x68(%ebp),%eax
     3b6:	50                   	push   %eax
     3b7:	68 79 13 00 00       	push   $0x1379
     3bc:	6a 00                	push   $0x0
     3be:	e8 8d 0b 00 00       	call   f50 <printf>
        if (ioctl(fd, SIOCGIFNETMASK, &ifr) == -1)
     3c3:	83 c4 1c             	add    $0x1c,%esp
     3c6:	8d 45 84             	lea    -0x7c(%ebp),%eax
        ifr.ifr_netmask.sa_family = AF_INET;
     3c9:	ba 02 00 00 00       	mov    $0x2,%edx
        if (ioctl(fd, SIOCGIFNETMASK, &ifr) == -1)
     3ce:	50                   	push   %eax
     3cf:	68 09 69 20 c0       	push   $0xc0206909
     3d4:	56                   	push   %esi
        ifr.ifr_netmask.sa_family = AF_INET;
     3d5:	66 89 55 94          	mov    %dx,-0x6c(%ebp)
        if (ioctl(fd, SIOCGIFNETMASK, &ifr) == -1)
     3d9:	e8 6f 0a 00 00       	call   e4d <ioctl>
     3de:	83 c4 10             	add    $0x10,%esp
     3e1:	83 f8 ff             	cmp    $0xffffffff,%eax
     3e4:	75 7a                	jne    460 <display+0x1f0>
    close(fd);
     3e6:	83 ec 0c             	sub    $0xc,%esp
     3e9:	56                   	push   %esi
     3ea:	e8 e6 09 00 00       	call   dd5 <close>
     3ef:	83 c4 10             	add    $0x10,%esp
}
     3f2:	8d 65 f4             	lea    -0xc(%ebp),%esp
     3f5:	5b                   	pop    %ebx
     3f6:	5e                   	pop    %esi
     3f7:	5f                   	pop    %edi
     3f8:	5d                   	pop    %ebp
     3f9:	c3                   	ret    
     3fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
                printf(0, "|");
     400:	83 ec 08             	sub    $0x8,%esp
     403:	89 95 74 ff ff ff    	mov    %edx,-0x8c(%ebp)
     409:	68 54 13 00 00       	push   $0x1354
     40e:	6a 00                	push   $0x0
     410:	e8 3b 0b 00 00       	call   f50 <printf>
     415:	8b 95 74 ff ff ff    	mov    -0x8c(%ebp),%edx
     41b:	83 c4 10             	add    $0x10,%esp
            printf(0, *s);
     41e:	83 ec 08             	sub    $0x8,%esp
     421:	52                   	push   %edx
     422:	6a 00                	push   $0x0
     424:	e8 27 0b 00 00       	call   f50 <printf>
     429:	83 c4 10             	add    $0x10,%esp
            any = 1;
     42c:	b9 01 00 00 00       	mov    $0x1,%ecx
    for (s = str; *s; s++) {
     431:	8b 53 04             	mov    0x4(%ebx),%edx
     434:	83 c3 04             	add    $0x4,%ebx
        mask <<= 1;
     437:	01 ff                	add    %edi,%edi
    for (s = str; *s; s++) {
     439:	85 d2                	test   %edx,%edx
     43b:	0f 84 df fe ff ff    	je     320 <display+0xb0>
        if (ifr.ifr_flags & mask) {
     441:	66 85 7d 94          	test   %di,-0x6c(%ebp)
     445:	74 ea                	je     431 <display+0x1c1>
            if (any)
     447:	85 c9                	test   %ecx,%ecx
     449:	74 d3                	je     41e <display+0x1ae>
     44b:	eb b3                	jmp    400 <display+0x190>
     44d:	8d 76 00             	lea    0x0(%esi),%esi
        ifr.ifr_mtu = 0;
     450:	c7 45 94 00 00 00 00 	movl   $0x0,-0x6c(%ebp)
     457:	31 c0                	xor    %eax,%eax
     459:	e9 f2 fe ff ff       	jmp    350 <display+0xe0>
     45e:	66 90                	xchg   %ax,%ax
        printf(0, " netmask %d.%d.%d.%d", p[0], p[1], p[2], p[3]);
     460:	0f b6 45 9b          	movzbl -0x65(%ebp),%eax
     464:	83 ec 08             	sub    $0x8,%esp
     467:	50                   	push   %eax
     468:	0f b6 45 9a          	movzbl -0x66(%ebp),%eax
     46c:	50                   	push   %eax
     46d:	0f b6 45 99          	movzbl -0x67(%ebp),%eax
     471:	50                   	push   %eax
     472:	0f b6 45 98          	movzbl -0x68(%ebp),%eax
     476:	50                   	push   %eax
     477:	68 8b 13 00 00       	push   $0x138b
     47c:	6a 00                	push   $0x0
     47e:	e8 cd 0a 00 00       	call   f50 <printf>
        ifr.ifr_broadaddr.sa_family = AF_INET;
     483:	b8 02 00 00 00       	mov    $0x2,%eax
        if (ioctl(fd, SIOCGIFBRDADDR, &ifr) == -1)
     488:	83 c4 1c             	add    $0x1c,%esp
        ifr.ifr_broadaddr.sa_family = AF_INET;
     48b:	66 89 45 94          	mov    %ax,-0x6c(%ebp)
        if (ioctl(fd, SIOCGIFBRDADDR, &ifr) == -1)
     48f:	8d 45 84             	lea    -0x7c(%ebp),%eax
     492:	50                   	push   %eax
     493:	68 0b 69 20 c0       	push   $0xc020690b
     498:	56                   	push   %esi
     499:	e8 af 09 00 00       	call   e4d <ioctl>
     49e:	83 c4 10             	add    $0x10,%esp
     4a1:	83 f8 ff             	cmp    $0xffffffff,%eax
     4a4:	0f 84 3c ff ff ff    	je     3e6 <display+0x176>
        printf(0, " broadcast %d.%d.%d.%d\n", p[0], p[1], p[2], p[3]);
     4aa:	0f b6 45 9b          	movzbl -0x65(%ebp),%eax
     4ae:	83 ec 08             	sub    $0x8,%esp
     4b1:	50                   	push   %eax
     4b2:	0f b6 45 9a          	movzbl -0x66(%ebp),%eax
     4b6:	50                   	push   %eax
     4b7:	0f b6 45 99          	movzbl -0x67(%ebp),%eax
     4bb:	50                   	push   %eax
     4bc:	0f b6 45 98          	movzbl -0x68(%ebp),%eax
     4c0:	50                   	push   %eax
     4c1:	68 a0 13 00 00       	push   $0x13a0
     4c6:	6a 00                	push   $0x0
     4c8:	e8 83 0a 00 00       	call   f50 <printf>
     4cd:	83 c4 20             	add    $0x20,%esp
     4d0:	e9 11 ff ff ff       	jmp    3e6 <display+0x176>
     4d5:	8d 76 00             	lea    0x0(%esi),%esi
        printf(0, "\tether %x:%x:%x:%x:%x:%x\n", p[0], p[1], p[2], p[3], p[4], p[5]);
     4d8:	0f b6 45 9b          	movzbl -0x65(%ebp),%eax
     4dc:	50                   	push   %eax
     4dd:	0f b6 45 9a          	movzbl -0x66(%ebp),%eax
     4e1:	50                   	push   %eax
     4e2:	0f b6 45 99          	movzbl -0x67(%ebp),%eax
     4e6:	50                   	push   %eax
     4e7:	0f b6 45 98          	movzbl -0x68(%ebp),%eax
     4eb:	50                   	push   %eax
     4ec:	0f b6 45 97          	movzbl -0x69(%ebp),%eax
     4f0:	50                   	push   %eax
     4f1:	0f b6 45 96          	movzbl -0x6a(%ebp),%eax
     4f5:	50                   	push   %eax
     4f6:	68 5f 13 00 00       	push   $0x135f
     4fb:	6a 00                	push   $0x0
     4fd:	e8 4e 0a 00 00       	call   f50 <printf>
     502:	83 c4 20             	add    $0x20,%esp
     505:	e9 73 fe ff ff       	jmp    37d <display+0x10d>
     50a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        close(fd);
     510:	83 ec 0c             	sub    $0xc,%esp
     513:	56                   	push   %esi
     514:	e8 bc 08 00 00       	call   dd5 <close>
        printf(0, "ifconfig: interface %s does not exist\n", name);
     519:	83 c4 0c             	add    $0xc,%esp
     51c:	ff b5 74 ff ff ff    	pushl  -0x8c(%ebp)
     522:	68 e4 13 00 00       	push   $0x13e4
     527:	6a 00                	push   $0x0
     529:	e8 22 0a 00 00       	call   f50 <printf>
        return;
     52e:	83 c4 10             	add    $0x10,%esp
}
     531:	8d 65 f4             	lea    -0xc(%ebp),%esp
     534:	5b                   	pop    %ebx
     535:	5e                   	pop    %esi
     536:	5f                   	pop    %edi
     537:	5d                   	pop    %ebp
     538:	c3                   	ret    
     539:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000540 <display_all>:
{
     540:	55                   	push   %ebp
    struct ifreq ifr = {.ifr_ifindex = 0};
     541:	31 d2                	xor    %edx,%edx
     543:	31 c0                	xor    %eax,%eax
{
     545:	89 e5                	mov    %esp,%ebp
     547:	56                   	push   %esi
     548:	53                   	push   %ebx
     549:	83 ec 20             	sub    $0x20,%esp
    struct ifreq ifr = {.ifr_ifindex = 0};
     54c:	89 54 05 d8          	mov    %edx,-0x28(%ebp,%eax,1)
     550:	83 c0 04             	add    $0x4,%eax
     553:	83 f8 20             	cmp    $0x20,%eax
     556:	72 f4                	jb     54c <display_all+0xc>
    fd = socket(AF_INET, SOCK_DGRAM, 0);
     558:	50                   	push   %eax
     559:	8d 5d d8             	lea    -0x28(%ebp),%ebx
     55c:	6a 00                	push   $0x0
     55e:	6a 02                	push   $0x2
     560:	6a 02                	push   $0x2
     562:	e8 ee 08 00 00       	call   e55 <socket>
    if (fd == -1) {
     567:	83 c4 10             	add    $0x10,%esp
    fd = socket(AF_INET, SOCK_DGRAM, 0);
     56a:	89 c6                	mov    %eax,%esi
    if (fd == -1) {
     56c:	83 f8 ff             	cmp    $0xffffffff,%eax
     56f:	75 12                	jne    583 <display_all+0x43>
     571:	eb 3a                	jmp    5ad <display_all+0x6d>
     573:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     577:	90                   	nop
        display(ifr.ifr_name);
     578:	89 d8                	mov    %ebx,%eax
     57a:	e8 f1 fc ff ff       	call   270 <display>
        ifr.ifr_ifindex++;
     57f:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
        if (ioctl(fd, SIOCGIFNAME, &ifr) == -1)
     583:	83 ec 04             	sub    $0x4,%esp
     586:	53                   	push   %ebx
     587:	68 01 69 20 c0       	push   $0xc0206901
     58c:	56                   	push   %esi
     58d:	e8 bb 08 00 00       	call   e4d <ioctl>
     592:	83 c4 10             	add    $0x10,%esp
     595:	83 f8 ff             	cmp    $0xffffffff,%eax
     598:	75 de                	jne    578 <display_all+0x38>
    close(fd);
     59a:	83 ec 0c             	sub    $0xc,%esp
     59d:	56                   	push   %esi
     59e:	e8 32 08 00 00       	call   dd5 <close>
}
     5a3:	83 c4 10             	add    $0x10,%esp
     5a6:	8d 65 f8             	lea    -0x8(%ebp),%esp
     5a9:	5b                   	pop    %ebx
     5aa:	5e                   	pop    %esi
     5ab:	5d                   	pop    %ebp
     5ac:	c3                   	ret    
        exit();
     5ad:	e8 fb 07 00 00       	call   dad <exit>
     5b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     5b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000005c0 <ifset>:
{
     5c0:	55                   	push   %ebp
     5c1:	89 e5                	mov    %esp,%ebp
     5c3:	57                   	push   %edi
     5c4:	89 c7                	mov    %eax,%edi
     5c6:	56                   	push   %esi
     5c7:	53                   	push   %ebx
     5c8:	89 d3                	mov    %edx,%ebx
     5ca:	83 ec 40             	sub    $0x40,%esp
     5cd:	89 45 c0             	mov    %eax,-0x40(%ebp)
    fd = socket(AF_INET, SOCK_DGRAM, 0);
     5d0:	6a 00                	push   $0x0
     5d2:	6a 02                	push   $0x2
     5d4:	6a 02                	push   $0x2
{
     5d6:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
    fd = socket(AF_INET, SOCK_DGRAM, 0);
     5d9:	e8 77 08 00 00       	call   e55 <socket>
    if (fd == -1)
     5de:	83 c4 10             	add    $0x10,%esp
     5e1:	83 f8 ff             	cmp    $0xffffffff,%eax
     5e4:	74 5f                	je     645 <ifset+0x85>
    strcpy(ifr.ifr_name, name); 
     5e6:	52                   	push   %edx
     5e7:	89 c6                	mov    %eax,%esi
     5e9:	52                   	push   %edx
     5ea:	57                   	push   %edi
     5eb:	8d 7d c8             	lea    -0x38(%ebp),%edi
     5ee:	57                   	push   %edi
     5ef:	e8 ec 00 00 00       	call   6e0 <strcpy>
    if (ioctl(fd, SIOCSIFADDR, &ifr) == -1) {
     5f4:	83 c4 0c             	add    $0xc,%esp
    ((struct sockaddr_in *)&ifr.ifr_addr)->sin_addr = *addr;
     5f7:	8b 03                	mov    (%ebx),%eax
    ifr.ifr_addr.sa_family = AF_INET;
     5f9:	66 c7 45 d8 02 00    	movw   $0x2,-0x28(%ebp)
    if (ioctl(fd, SIOCSIFADDR, &ifr) == -1) {
     5ff:	57                   	push   %edi
     600:	68 08 69 20 80       	push   $0x80206908
     605:	56                   	push   %esi
    ((struct sockaddr_in *)&ifr.ifr_addr)->sin_addr = *addr;
     606:	89 45 dc             	mov    %eax,-0x24(%ebp)
    if (ioctl(fd, SIOCSIFADDR, &ifr) == -1) {
     609:	e8 3f 08 00 00       	call   e4d <ioctl>
     60e:	83 c4 10             	add    $0x10,%esp
     611:	83 c0 01             	add    $0x1,%eax
     614:	74 57                	je     66d <ifset+0xad>
    ((struct sockaddr_in *)&ifr.ifr_netmask)->sin_addr = *netmask;
     616:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    ifr.ifr_netmask.sa_family = AF_INET;
     619:	66 c7 45 d8 02 00    	movw   $0x2,-0x28(%ebp)
    ((struct sockaddr_in *)&ifr.ifr_netmask)->sin_addr = *netmask;
     61f:	8b 00                	mov    (%eax),%eax
     621:	89 45 dc             	mov    %eax,-0x24(%ebp)
    if (ioctl(fd, SIOCSIFNETMASK, &ifr) == -1) {
     624:	50                   	push   %eax
     625:	57                   	push   %edi
     626:	68 0a 69 20 80       	push   $0x8020690a
     62b:	56                   	push   %esi
     62c:	e8 1c 08 00 00       	call   e4d <ioctl>
     631:	83 c4 10             	add    $0x10,%esp
     634:	83 c0 01             	add    $0x1,%eax
     637:	74 14                	je     64d <ifset+0x8d>
    close(fd);
     639:	83 ec 0c             	sub    $0xc,%esp
     63c:	56                   	push   %esi
     63d:	e8 93 07 00 00       	call   dd5 <close>
     642:	83 c4 10             	add    $0x10,%esp
}
     645:	8d 65 f4             	lea    -0xc(%ebp),%esp
     648:	5b                   	pop    %ebx
     649:	5e                   	pop    %esi
     64a:	5f                   	pop    %edi
     64b:	5d                   	pop    %ebp
     64c:	c3                   	ret    
        close(fd);
     64d:	83 ec 0c             	sub    $0xc,%esp
     650:	56                   	push   %esi
     651:	e8 7f 07 00 00       	call   dd5 <close>
        printf(0, "ifconfig: ioctl(SIOCSIFNETMASK) failure, interface=%s\n", name);
     656:	83 c4 0c             	add    $0xc,%esp
     659:	ff 75 c0             	pushl  -0x40(%ebp)
     65c:	68 40 14 00 00       	push   $0x1440
     661:	6a 00                	push   $0x0
     663:	e8 e8 08 00 00       	call   f50 <printf>
        return;
     668:	83 c4 10             	add    $0x10,%esp
     66b:	eb d8                	jmp    645 <ifset+0x85>
        close(fd);
     66d:	83 ec 0c             	sub    $0xc,%esp
     670:	56                   	push   %esi
     671:	e8 5f 07 00 00       	call   dd5 <close>
        printf(0, "ifconfig: ioctl(SIOCSIFADDR) failure, interface=%s\n", name);
     676:	83 c4 0c             	add    $0xc,%esp
     679:	ff 75 c0             	pushl  -0x40(%ebp)
     67c:	68 0c 14 00 00       	push   $0x140c
     681:	6a 00                	push   $0x0
     683:	e8 c8 08 00 00       	call   f50 <printf>
        return;
     688:	83 c4 10             	add    $0x10,%esp
     68b:	eb b8                	jmp    645 <ifset+0x85>
     68d:	8d 76 00             	lea    0x0(%esi),%esi

00000690 <usage>:
{
     690:	55                   	push   %ebp
     691:	89 e5                	mov    %esp,%ebp
     693:	83 ec 10             	sub    $0x10,%esp
    printf(0, "usage: ifconfig interface [command|address]\n");
     696:	68 78 14 00 00       	push   $0x1478
     69b:	6a 00                	push   $0x0
     69d:	e8 ae 08 00 00       	call   f50 <printf>
    printf(0, "           - command: up | down\n");
     6a2:	58                   	pop    %eax
     6a3:	5a                   	pop    %edx
     6a4:	68 a8 14 00 00       	push   $0x14a8
     6a9:	6a 00                	push   $0x0
     6ab:	e8 a0 08 00 00       	call   f50 <printf>
    printf(0, "           - address: ADDRESS/PREFIX | ADDRESS netmask NETMASK\n");
     6b0:	59                   	pop    %ecx
     6b1:	58                   	pop    %eax
     6b2:	68 cc 14 00 00       	push   $0x14cc
     6b7:	6a 00                	push   $0x0
     6b9:	e8 92 08 00 00       	call   f50 <printf>
    printf(0, "       ifconfig [-a]\n");
     6be:	58                   	pop    %eax
     6bf:	5a                   	pop    %edx
     6c0:	68 b8 13 00 00       	push   $0x13b8
     6c5:	6a 00                	push   $0x0
     6c7:	e8 84 08 00 00       	call   f50 <printf>
    exit();
     6cc:	e8 dc 06 00 00       	call   dad <exit>
     6d1:	66 90                	xchg   %ax,%ax
     6d3:	66 90                	xchg   %ax,%ax
     6d5:	66 90                	xchg   %ax,%ax
     6d7:	66 90                	xchg   %ax,%ax
     6d9:	66 90                	xchg   %ax,%ax
     6db:	66 90                	xchg   %ax,%ax
     6dd:	66 90                	xchg   %ax,%ax
     6df:	90                   	nop

000006e0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
     6e0:	f3 0f 1e fb          	endbr32 
     6e4:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     6e5:	31 c0                	xor    %eax,%eax
{
     6e7:	89 e5                	mov    %esp,%ebp
     6e9:	53                   	push   %ebx
     6ea:	8b 4d 08             	mov    0x8(%ebp),%ecx
     6ed:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
     6f0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     6f4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     6f7:	83 c0 01             	add    $0x1,%eax
     6fa:	84 d2                	test   %dl,%dl
     6fc:	75 f2                	jne    6f0 <strcpy+0x10>
    ;
  return os;
}
     6fe:	89 c8                	mov    %ecx,%eax
     700:	5b                   	pop    %ebx
     701:	5d                   	pop    %ebp
     702:	c3                   	ret    
     703:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     70a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000710 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     710:	f3 0f 1e fb          	endbr32 
     714:	55                   	push   %ebp
     715:	89 e5                	mov    %esp,%ebp
     717:	53                   	push   %ebx
     718:	8b 4d 08             	mov    0x8(%ebp),%ecx
     71b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
     71e:	0f b6 01             	movzbl (%ecx),%eax
     721:	0f b6 1a             	movzbl (%edx),%ebx
     724:	84 c0                	test   %al,%al
     726:	75 19                	jne    741 <strcmp+0x31>
     728:	eb 26                	jmp    750 <strcmp+0x40>
     72a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     730:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
     734:	83 c1 01             	add    $0x1,%ecx
     737:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
     73a:	0f b6 1a             	movzbl (%edx),%ebx
     73d:	84 c0                	test   %al,%al
     73f:	74 0f                	je     750 <strcmp+0x40>
     741:	38 d8                	cmp    %bl,%al
     743:	74 eb                	je     730 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
     745:	29 d8                	sub    %ebx,%eax
}
     747:	5b                   	pop    %ebx
     748:	5d                   	pop    %ebp
     749:	c3                   	ret    
     74a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     750:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
     752:	29 d8                	sub    %ebx,%eax
}
     754:	5b                   	pop    %ebx
     755:	5d                   	pop    %ebp
     756:	c3                   	ret    
     757:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     75e:	66 90                	xchg   %ax,%ax

00000760 <strlen>:

uint
strlen(const char *s)
{
     760:	f3 0f 1e fb          	endbr32 
     764:	55                   	push   %ebp
     765:	89 e5                	mov    %esp,%ebp
     767:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
     76a:	80 3a 00             	cmpb   $0x0,(%edx)
     76d:	74 21                	je     790 <strlen+0x30>
     76f:	31 c0                	xor    %eax,%eax
     771:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     778:	83 c0 01             	add    $0x1,%eax
     77b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     77f:	89 c1                	mov    %eax,%ecx
     781:	75 f5                	jne    778 <strlen+0x18>
    ;
  return n;
}
     783:	89 c8                	mov    %ecx,%eax
     785:	5d                   	pop    %ebp
     786:	c3                   	ret    
     787:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     78e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
     790:	31 c9                	xor    %ecx,%ecx
}
     792:	5d                   	pop    %ebp
     793:	89 c8                	mov    %ecx,%eax
     795:	c3                   	ret    
     796:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     79d:	8d 76 00             	lea    0x0(%esi),%esi

000007a0 <memset>:

void*
memset(void *dst, int c, uint n)
{
     7a0:	f3 0f 1e fb          	endbr32 
     7a4:	55                   	push   %ebp
     7a5:	89 e5                	mov    %esp,%ebp
     7a7:	57                   	push   %edi
     7a8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     7ab:	8b 4d 10             	mov    0x10(%ebp),%ecx
     7ae:	8b 45 0c             	mov    0xc(%ebp),%eax
     7b1:	89 d7                	mov    %edx,%edi
     7b3:	fc                   	cld    
     7b4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     7b6:	89 d0                	mov    %edx,%eax
     7b8:	5f                   	pop    %edi
     7b9:	5d                   	pop    %ebp
     7ba:	c3                   	ret    
     7bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     7bf:	90                   	nop

000007c0 <strchr>:

char*
strchr(const char *s, char c)
{
     7c0:	f3 0f 1e fb          	endbr32 
     7c4:	55                   	push   %ebp
     7c5:	89 e5                	mov    %esp,%ebp
     7c7:	8b 45 08             	mov    0x8(%ebp),%eax
     7ca:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     7ce:	0f b6 10             	movzbl (%eax),%edx
     7d1:	84 d2                	test   %dl,%dl
     7d3:	75 16                	jne    7eb <strchr+0x2b>
     7d5:	eb 21                	jmp    7f8 <strchr+0x38>
     7d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     7de:	66 90                	xchg   %ax,%ax
     7e0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
     7e4:	83 c0 01             	add    $0x1,%eax
     7e7:	84 d2                	test   %dl,%dl
     7e9:	74 0d                	je     7f8 <strchr+0x38>
    if(*s == c)
     7eb:	38 d1                	cmp    %dl,%cl
     7ed:	75 f1                	jne    7e0 <strchr+0x20>
      return (char*)s;
  return 0;
}
     7ef:	5d                   	pop    %ebp
     7f0:	c3                   	ret    
     7f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
     7f8:	31 c0                	xor    %eax,%eax
}
     7fa:	5d                   	pop    %ebp
     7fb:	c3                   	ret    
     7fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000800 <gets>:

char*
gets(char *buf, int max)
{
     800:	f3 0f 1e fb          	endbr32 
     804:	55                   	push   %ebp
     805:	89 e5                	mov    %esp,%ebp
     807:	57                   	push   %edi
     808:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     809:	31 f6                	xor    %esi,%esi
{
     80b:	53                   	push   %ebx
     80c:	89 f3                	mov    %esi,%ebx
     80e:	83 ec 1c             	sub    $0x1c,%esp
     811:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
     814:	eb 33                	jmp    849 <gets+0x49>
     816:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     81d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
     820:	83 ec 04             	sub    $0x4,%esp
     823:	8d 45 e7             	lea    -0x19(%ebp),%eax
     826:	6a 01                	push   $0x1
     828:	50                   	push   %eax
     829:	6a 00                	push   $0x0
     82b:	e8 95 05 00 00       	call   dc5 <read>
    if(cc < 1)
     830:	83 c4 10             	add    $0x10,%esp
     833:	85 c0                	test   %eax,%eax
     835:	7e 1c                	jle    853 <gets+0x53>
      break;
    buf[i++] = c;
     837:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     83b:	83 c7 01             	add    $0x1,%edi
     83e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
     841:	3c 0a                	cmp    $0xa,%al
     843:	74 23                	je     868 <gets+0x68>
     845:	3c 0d                	cmp    $0xd,%al
     847:	74 1f                	je     868 <gets+0x68>
  for(i=0; i+1 < max; ){
     849:	83 c3 01             	add    $0x1,%ebx
     84c:	89 fe                	mov    %edi,%esi
     84e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     851:	7c cd                	jl     820 <gets+0x20>
     853:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
     855:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
     858:	c6 03 00             	movb   $0x0,(%ebx)
}
     85b:	8d 65 f4             	lea    -0xc(%ebp),%esp
     85e:	5b                   	pop    %ebx
     85f:	5e                   	pop    %esi
     860:	5f                   	pop    %edi
     861:	5d                   	pop    %ebp
     862:	c3                   	ret    
     863:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     867:	90                   	nop
     868:	8b 75 08             	mov    0x8(%ebp),%esi
     86b:	8b 45 08             	mov    0x8(%ebp),%eax
     86e:	01 de                	add    %ebx,%esi
     870:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
     872:	c6 03 00             	movb   $0x0,(%ebx)
}
     875:	8d 65 f4             	lea    -0xc(%ebp),%esp
     878:	5b                   	pop    %ebx
     879:	5e                   	pop    %esi
     87a:	5f                   	pop    %edi
     87b:	5d                   	pop    %ebp
     87c:	c3                   	ret    
     87d:	8d 76 00             	lea    0x0(%esi),%esi

00000880 <stat>:

int
stat(const char *n, struct stat *st)
{
     880:	f3 0f 1e fb          	endbr32 
     884:	55                   	push   %ebp
     885:	89 e5                	mov    %esp,%ebp
     887:	56                   	push   %esi
     888:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     889:	83 ec 08             	sub    $0x8,%esp
     88c:	6a 00                	push   $0x0
     88e:	ff 75 08             	pushl  0x8(%ebp)
     891:	e8 57 05 00 00       	call   ded <open>
  if(fd < 0)
     896:	83 c4 10             	add    $0x10,%esp
     899:	85 c0                	test   %eax,%eax
     89b:	78 2b                	js     8c8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
     89d:	83 ec 08             	sub    $0x8,%esp
     8a0:	ff 75 0c             	pushl  0xc(%ebp)
     8a3:	89 c3                	mov    %eax,%ebx
     8a5:	50                   	push   %eax
     8a6:	e8 5a 05 00 00       	call   e05 <fstat>
  close(fd);
     8ab:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     8ae:	89 c6                	mov    %eax,%esi
  close(fd);
     8b0:	e8 20 05 00 00       	call   dd5 <close>
  return r;
     8b5:	83 c4 10             	add    $0x10,%esp
}
     8b8:	8d 65 f8             	lea    -0x8(%ebp),%esp
     8bb:	89 f0                	mov    %esi,%eax
     8bd:	5b                   	pop    %ebx
     8be:	5e                   	pop    %esi
     8bf:	5d                   	pop    %ebp
     8c0:	c3                   	ret    
     8c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
     8c8:	be ff ff ff ff       	mov    $0xffffffff,%esi
     8cd:	eb e9                	jmp    8b8 <stat+0x38>
     8cf:	90                   	nop

000008d0 <atoi>:

int
atoi(const char *s)
{
     8d0:	f3 0f 1e fb          	endbr32 
     8d4:	55                   	push   %ebp
     8d5:	89 e5                	mov    %esp,%ebp
     8d7:	53                   	push   %ebx
     8d8:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     8db:	0f be 02             	movsbl (%edx),%eax
     8de:	8d 48 d0             	lea    -0x30(%eax),%ecx
     8e1:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
     8e4:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
     8e9:	77 1a                	ja     905 <atoi+0x35>
     8eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     8ef:	90                   	nop
    n = n*10 + *s++ - '0';
     8f0:	83 c2 01             	add    $0x1,%edx
     8f3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
     8f6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
     8fa:	0f be 02             	movsbl (%edx),%eax
     8fd:	8d 58 d0             	lea    -0x30(%eax),%ebx
     900:	80 fb 09             	cmp    $0x9,%bl
     903:	76 eb                	jbe    8f0 <atoi+0x20>
  return n;
}
     905:	89 c8                	mov    %ecx,%eax
     907:	5b                   	pop    %ebx
     908:	5d                   	pop    %ebp
     909:	c3                   	ret    
     90a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000910 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     910:	f3 0f 1e fb          	endbr32 
     914:	55                   	push   %ebp
     915:	89 e5                	mov    %esp,%ebp
     917:	57                   	push   %edi
     918:	8b 45 10             	mov    0x10(%ebp),%eax
     91b:	8b 55 08             	mov    0x8(%ebp),%edx
     91e:	56                   	push   %esi
     91f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     922:	85 c0                	test   %eax,%eax
     924:	7e 0f                	jle    935 <memmove+0x25>
     926:	01 d0                	add    %edx,%eax
  dst = vdst;
     928:	89 d7                	mov    %edx,%edi
     92a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
     930:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
     931:	39 f8                	cmp    %edi,%eax
     933:	75 fb                	jne    930 <memmove+0x20>
  return vdst;
}
     935:	5e                   	pop    %esi
     936:	89 d0                	mov    %edx,%eax
     938:	5f                   	pop    %edi
     939:	5d                   	pop    %ebp
     93a:	c3                   	ret    
     93b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     93f:	90                   	nop

00000940 <hexdump>:

#define isascii(x) ((x >= 0x00) && (x <= 0x7f))
#define isprint(x) ((x >= 0x20) && (x <= 0x7e))

void
hexdump (void *data, size_t size) {
     940:	f3 0f 1e fb          	endbr32 
     944:	55                   	push   %ebp
     945:	89 e5                	mov    %esp,%ebp
     947:	57                   	push   %edi
     948:	56                   	push   %esi
     949:	53                   	push   %ebx
     94a:	83 ec 34             	sub    $0x34,%esp
     94d:	8b 45 08             	mov    0x8(%ebp),%eax
  int offset, index;
  unsigned char *src;

  src = (unsigned char *)data;
  printf(1, "+------+-------------------------------------------------+------------------+\n");
     950:	68 a4 15 00 00       	push   $0x15a4
hexdump (void *data, size_t size) {
     955:	89 45 e0             	mov    %eax,-0x20(%ebp)
     958:	8b 45 0c             	mov    0xc(%ebp),%eax
  printf(1, "+------+-------------------------------------------------+------------------+\n");
     95b:	6a 01                	push   $0x1
hexdump (void *data, size_t size) {
     95d:	89 c7                	mov    %eax,%edi
     95f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  printf(1, "+------+-------------------------------------------------+------------------+\n");
     962:	e8 e9 05 00 00       	call   f50 <printf>
  for (offset = 0; offset < size; offset += 16) {
     967:	83 c4 10             	add    $0x10,%esp
     96a:	85 ff                	test   %edi,%edi
     96c:	0f 84 2d 01 00 00    	je     a9f <hexdump+0x15f>
     972:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     975:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
     97c:	be 10 00 00 00       	mov    $0x10,%esi
     981:	83 e8 01             	sub    $0x1,%eax
     984:	83 e0 f0             	and    $0xfffffff0,%eax
     987:	83 c0 10             	add    $0x10,%eax
     98a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     98d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "| ");
     990:	83 ec 08             	sub    $0x8,%esp
     993:	68 f8 15 00 00       	push   $0x15f8
     998:	6a 01                	push   $0x1
     99a:	e8 b1 05 00 00       	call   f50 <printf>
    if (offset <= 0x0fff) printf(1, "0");
     99f:	83 c4 10             	add    $0x10,%esp
     9a2:	81 7d dc ff 0f 00 00 	cmpl   $0xfff,-0x24(%ebp)
     9a9:	0f 8e 51 01 00 00    	jle    b00 <hexdump+0x1c0>
    if (offset <= 0x00ff) printf(1, "0");
    if (offset <= 0x000f) printf(1, "0");
    printf(1, "%x | ", offset);
     9af:	8b 7d dc             	mov    -0x24(%ebp),%edi
     9b2:	83 ec 04             	sub    $0x4,%esp
     9b5:	57                   	push   %edi
     9b6:	89 fb                	mov    %edi,%ebx
     9b8:	68 f5 15 00 00       	push   $0x15f5
     9bd:	6a 01                	push   $0x1
     9bf:	e8 8c 05 00 00       	call   f50 <printf>
     9c4:	89 7d d8             	mov    %edi,-0x28(%ebp)
     9c7:	83 c4 10             	add    $0x10,%esp
     9ca:	8b 7d e0             	mov    -0x20(%ebp),%edi
     9cd:	eb 28                	jmp    9f7 <hexdump+0xb7>
     9cf:	90                   	nop
    for (index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if (src[offset + index] <= 0x0f) printf(1, "0");
     9d0:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
     9d4:	80 fa 0f             	cmp    $0xf,%dl
     9d7:	0f 86 e3 00 00 00    	jbe    ac0 <hexdump+0x180>
        printf(1, "%x ", 0xff & src[offset + index]);
     9dd:	83 ec 04             	sub    $0x4,%esp
     9e0:	83 c3 01             	add    $0x1,%ebx
     9e3:	52                   	push   %edx
     9e4:	68 fb 15 00 00       	push   $0x15fb
     9e9:	6a 01                	push   $0x1
     9eb:	e8 60 05 00 00       	call   f50 <printf>
     9f0:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
     9f3:	39 f3                	cmp    %esi,%ebx
     9f5:	74 1e                	je     a15 <hexdump+0xd5>
      if(offset + index < (int)size) {
     9f7:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
     9fa:	7f d4                	jg     9d0 <hexdump+0x90>
      } else {
        printf(1, "   ");
     9fc:	83 ec 08             	sub    $0x8,%esp
     9ff:	83 c3 01             	add    $0x1,%ebx
     a02:	68 ff 15 00 00       	push   $0x15ff
     a07:	6a 01                	push   $0x1
     a09:	e8 42 05 00 00       	call   f50 <printf>
     a0e:	83 c4 10             	add    $0x10,%esp
    for (index = 0; index < 16; index++) {
     a11:	39 f3                	cmp    %esi,%ebx
     a13:	75 e2                	jne    9f7 <hexdump+0xb7>
      }
    }
    printf(1, "| ");
     a15:	83 ec 08             	sub    $0x8,%esp
     a18:	8b 5d d8             	mov    -0x28(%ebp),%ebx
     a1b:	68 f8 15 00 00       	push   $0x15f8
     a20:	6a 01                	push   $0x1
     a22:	e8 29 05 00 00       	call   f50 <printf>
     a27:	8b 7d e4             	mov    -0x1c(%ebp),%edi
     a2a:	83 c4 10             	add    $0x10,%esp
     a2d:	eb 1b                	jmp    a4a <hexdump+0x10a>
     a2f:	90                   	nop
    for(index = 0; index < 16; index++) {
      if(offset + index < (int)size) {
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
          printf(1, "%c", src[offset + index]);
     a30:	83 ec 04             	sub    $0x4,%esp
     a33:	52                   	push   %edx
     a34:	68 03 16 00 00       	push   $0x1603
     a39:	6a 01                	push   $0x1
     a3b:	e8 10 05 00 00       	call   f50 <printf>
     a40:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
     a43:	83 c3 01             	add    $0x1,%ebx
     a46:	39 de                	cmp    %ebx,%esi
     a48:	74 30                	je     a7a <hexdump+0x13a>
      if(offset + index < (int)size) {
     a4a:	39 df                	cmp    %ebx,%edi
     a4c:	0f 8e 8e 00 00 00    	jle    ae0 <hexdump+0x1a0>
        if(isascii(src[offset + index]) && isprint(src[offset + index])) {
     a52:	8b 45 e0             	mov    -0x20(%ebp),%eax
     a55:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
     a59:	8d 4a e0             	lea    -0x20(%edx),%ecx
     a5c:	80 f9 5e             	cmp    $0x5e,%cl
     a5f:	76 cf                	jbe    a30 <hexdump+0xf0>
        } else {
          printf(1, ".");
     a61:	83 ec 08             	sub    $0x8,%esp
     a64:	83 c3 01             	add    $0x1,%ebx
     a67:	68 06 16 00 00       	push   $0x1606
     a6c:	6a 01                	push   $0x1
     a6e:	e8 dd 04 00 00       	call   f50 <printf>
     a73:	83 c4 10             	add    $0x10,%esp
    for(index = 0; index < 16; index++) {
     a76:	39 de                	cmp    %ebx,%esi
     a78:	75 d0                	jne    a4a <hexdump+0x10a>
        }
      } else {
        printf(1, " ");
      }
    }
    printf(1, " |\n");
     a7a:	83 ec 08             	sub    $0x8,%esp
     a7d:	83 c6 10             	add    $0x10,%esi
     a80:	68 08 16 00 00       	push   $0x1608
     a85:	6a 01                	push   $0x1
     a87:	e8 c4 04 00 00       	call   f50 <printf>
  for (offset = 0; offset < size; offset += 16) {
     a8c:	83 45 dc 10          	addl   $0x10,-0x24(%ebp)
     a90:	83 c4 10             	add    $0x10,%esp
     a93:	8b 45 dc             	mov    -0x24(%ebp),%eax
     a96:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
     a99:	0f 85 f1 fe ff ff    	jne    990 <hexdump+0x50>
  }
  printf(1, "+------+-------------------------------------------------+------------------+\n");
     a9f:	c7 45 0c a4 15 00 00 	movl   $0x15a4,0xc(%ebp)
     aa6:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
}
     aad:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ab0:	5b                   	pop    %ebx
     ab1:	5e                   	pop    %esi
     ab2:	5f                   	pop    %edi
     ab3:	5d                   	pop    %ebp
  printf(1, "+------+-------------------------------------------------+------------------+\n");
     ab4:	e9 97 04 00 00       	jmp    f50 <printf>
     ab9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (src[offset + index] <= 0x0f) printf(1, "0");
     ac0:	83 ec 08             	sub    $0x8,%esp
     ac3:	68 f3 15 00 00       	push   $0x15f3
     ac8:	6a 01                	push   $0x1
     aca:	e8 81 04 00 00       	call   f50 <printf>
     acf:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
     ad3:	83 c4 10             	add    $0x10,%esp
     ad6:	e9 02 ff ff ff       	jmp    9dd <hexdump+0x9d>
     adb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     adf:	90                   	nop
        printf(1, " ");
     ae0:	83 ec 08             	sub    $0x8,%esp
     ae3:	68 01 16 00 00       	push   $0x1601
     ae8:	6a 01                	push   $0x1
     aea:	e8 61 04 00 00       	call   f50 <printf>
     aef:	83 c4 10             	add    $0x10,%esp
     af2:	e9 4c ff ff ff       	jmp    a43 <hexdump+0x103>
     af7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     afe:	66 90                	xchg   %ax,%ax
    if (offset <= 0x0fff) printf(1, "0");
     b00:	83 ec 08             	sub    $0x8,%esp
     b03:	68 f3 15 00 00       	push   $0x15f3
     b08:	6a 01                	push   $0x1
     b0a:	e8 41 04 00 00       	call   f50 <printf>
    if (offset <= 0x00ff) printf(1, "0");
     b0f:	8b 7d dc             	mov    -0x24(%ebp),%edi
     b12:	83 c4 10             	add    $0x10,%esp
     b15:	81 ff ff 00 00 00    	cmp    $0xff,%edi
     b1b:	0f 8f 8e fe ff ff    	jg     9af <hexdump+0x6f>
     b21:	83 ec 08             	sub    $0x8,%esp
     b24:	68 f3 15 00 00       	push   $0x15f3
     b29:	6a 01                	push   $0x1
     b2b:	e8 20 04 00 00       	call   f50 <printf>
    if (offset <= 0x000f) printf(1, "0");
     b30:	83 c4 10             	add    $0x10,%esp
     b33:	83 ff 0f             	cmp    $0xf,%edi
     b36:	0f 8f 73 fe ff ff    	jg     9af <hexdump+0x6f>
     b3c:	83 ec 08             	sub    $0x8,%esp
     b3f:	68 f3 15 00 00       	push   $0x15f3
     b44:	6a 01                	push   $0x1
     b46:	e8 05 04 00 00       	call   f50 <printf>
     b4b:	83 c4 10             	add    $0x10,%esp
     b4e:	e9 5c fe ff ff       	jmp    9af <hexdump+0x6f>
     b53:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000b60 <hton16>:
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
}

uint16_t
hton16 (uint16_t h)
{
     b60:	f3 0f 1e fb          	endbr32 
     b64:	55                   	push   %ebp
    if (!endian)
     b65:	a1 94 1a 00 00       	mov    0x1a94,%eax
{
     b6a:	89 e5                	mov    %esp,%ebp
     b6c:	8b 4d 08             	mov    0x8(%ebp),%ecx
    if (!endian)
     b6f:	85 c0                	test   %eax,%eax
     b71:	75 1d                	jne    b90 <hton16+0x30>
        endian = byteorder();
     b73:	c7 05 94 1a 00 00 d2 	movl   $0x4d2,0x1a94
     b7a:	04 00 00 
    return (v & 0x00ff) << 8 | (v & 0xff00 ) >> 8;
     b7d:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
}
     b7f:	5d                   	pop    %ebp
     b80:	66 c1 c2 08          	rol    $0x8,%dx
     b84:	89 d0                	mov    %edx,%eax
     b86:	c3                   	ret    
     b87:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b8e:	66 90                	xchg   %ax,%ax
     b90:	89 ca                	mov    %ecx,%edx
    return endian == __LITTLE_ENDIAN ? byteswap16(h) : h;
     b92:	3d d2 04 00 00       	cmp    $0x4d2,%eax
     b97:	74 e4                	je     b7d <hton16+0x1d>
}
     b99:	89 d0                	mov    %edx,%eax
     b9b:	5d                   	pop    %ebp
     b9c:	c3                   	ret    
     b9d:	8d 76 00             	lea    0x0(%esi),%esi

00000ba0 <ntoh16>:
     ba0:	f3 0f 1e fb          	endbr32 
     ba4:	eb ba                	jmp    b60 <hton16>
     ba6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     bad:	8d 76 00             	lea    0x0(%esi),%esi

00000bb0 <hton32>:
    return endian == __LITTLE_ENDIAN ? byteswap16(n) : n;
}

uint32_t
hton32(uint32_t h)
{
     bb0:	f3 0f 1e fb          	endbr32 
     bb4:	55                   	push   %ebp
    if (!endian)
     bb5:	8b 15 94 1a 00 00    	mov    0x1a94,%edx
{
     bbb:	89 e5                	mov    %esp,%ebp
     bbd:	8b 45 08             	mov    0x8(%ebp),%eax
    if (!endian)
     bc0:	85 d2                	test   %edx,%edx
     bc2:	75 14                	jne    bd8 <hton32+0x28>
        endian = byteorder();
     bc4:	c7 05 94 1a 00 00 d2 	movl   $0x4d2,0x1a94
     bcb:	04 00 00 
    return (v & 0x000000ff) << 24 | (v & 0x0000ff00) << 8 | (v & 0x00ff0000) >> 8 | (v & 0xff000000) >> 24;
     bce:	0f c8                	bswap  %eax
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
}
     bd0:	5d                   	pop    %ebp
     bd1:	c3                   	ret    
     bd2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return endian == __LITTLE_ENDIAN ? byteswap32(h) : h;
     bd8:	81 fa d2 04 00 00    	cmp    $0x4d2,%edx
     bde:	74 ee                	je     bce <hton32+0x1e>
}
     be0:	5d                   	pop    %ebp
     be1:	c3                   	ret    
     be2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     be9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000bf0 <ntoh32>:
     bf0:	f3 0f 1e fb          	endbr32 
     bf4:	eb ba                	jmp    bb0 <hton32>
     bf6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     bfd:	8d 76 00             	lea    0x0(%esi),%esi

00000c00 <strtol>:
    return endian == __LITTLE_ENDIAN ? byteswap32(n) : n;
}

long
strtol(const char *s, char **endptr, int base)
{
     c00:	f3 0f 1e fb          	endbr32 
     c04:	55                   	push   %ebp
     c05:	89 e5                	mov    %esp,%ebp
     c07:	57                   	push   %edi
     c08:	8b 4d 08             	mov    0x8(%ebp),%ecx
     c0b:	56                   	push   %esi
     c0c:	53                   	push   %ebx
     c0d:	8b 5d 10             	mov    0x10(%ebp),%ebx
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
     c10:	0f b6 01             	movzbl (%ecx),%eax
     c13:	3c 09                	cmp    $0x9,%al
     c15:	74 09                	je     c20 <strtol+0x20>
     c17:	3c 20                	cmp    $0x20,%al
     c19:	75 14                	jne    c2f <strtol+0x2f>
     c1b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c1f:	90                   	nop
     c20:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
        s++;
     c24:	83 c1 01             	add    $0x1,%ecx
    while (*s == ' ' || *s == '\t')
     c27:	3c 20                	cmp    $0x20,%al
     c29:	74 f5                	je     c20 <strtol+0x20>
     c2b:	3c 09                	cmp    $0x9,%al
     c2d:	74 f1                	je     c20 <strtol+0x20>

    // plus/minus sign
    if (*s == '+')
     c2f:	3c 2b                	cmp    $0x2b,%al
     c31:	0f 84 a9 00 00 00    	je     ce0 <strtol+0xe0>
    int neg = 0;
     c37:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
     c39:	3c 2d                	cmp    $0x2d,%al
     c3b:	0f 84 8f 00 00 00    	je     cd0 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
     c41:	0f be 11             	movsbl (%ecx),%edx
     c44:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
     c4a:	75 12                	jne    c5e <strtol+0x5e>
     c4c:	80 fa 30             	cmp    $0x30,%dl
     c4f:	0f 84 9b 00 00 00    	je     cf0 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
     c55:	85 db                	test   %ebx,%ebx
     c57:	75 05                	jne    c5e <strtol+0x5e>
        s++, base = 8;
    else if (base == 0)
        base = 10;
     c59:	bb 0a 00 00 00       	mov    $0xa,%ebx
     c5e:	89 5d 10             	mov    %ebx,0x10(%ebp)
     c61:	31 c0                	xor    %eax,%eax
     c63:	eb 17                	jmp    c7c <strtol+0x7c>
     c65:	8d 76 00             	lea    0x0(%esi),%esi
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
     c68:	83 ea 30             	sub    $0x30,%edx
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
     c6b:	3b 55 10             	cmp    0x10(%ebp),%edx
     c6e:	7d 28                	jge    c98 <strtol+0x98>
            break;
        s++, val = (val * base) + dig;
     c70:	0f af 45 10          	imul   0x10(%ebp),%eax
     c74:	83 c1 01             	add    $0x1,%ecx
     c77:	01 d0                	add    %edx,%eax
    while (1) {
     c79:	0f be 11             	movsbl (%ecx),%edx
        if (*s >= '0' && *s <= '9')
     c7c:	8d 72 d0             	lea    -0x30(%edx),%esi
     c7f:	89 f3                	mov    %esi,%ebx
     c81:	80 fb 09             	cmp    $0x9,%bl
     c84:	76 e2                	jbe    c68 <strtol+0x68>
        else if (*s >= 'a' && *s <= 'z')
     c86:	8d 72 9f             	lea    -0x61(%edx),%esi
     c89:	89 f3                	mov    %esi,%ebx
     c8b:	80 fb 19             	cmp    $0x19,%bl
     c8e:	77 28                	ja     cb8 <strtol+0xb8>
            dig = *s - 'a' + 10;
     c90:	83 ea 57             	sub    $0x57,%edx
        if (dig >= base)
     c93:	3b 55 10             	cmp    0x10(%ebp),%edx
     c96:	7c d8                	jl     c70 <strtol+0x70>
        // we don't properly detect overflow!
    }

    if (endptr)
     c98:	8b 55 0c             	mov    0xc(%ebp),%edx
     c9b:	85 d2                	test   %edx,%edx
     c9d:	74 05                	je     ca4 <strtol+0xa4>
        *endptr = (char *) s;
     c9f:	8b 75 0c             	mov    0xc(%ebp),%esi
     ca2:	89 0e                	mov    %ecx,(%esi)
    return (neg ? -val : val);
     ca4:	89 c2                	mov    %eax,%edx
}
     ca6:	5b                   	pop    %ebx
     ca7:	5e                   	pop    %esi
    return (neg ? -val : val);
     ca8:	f7 da                	neg    %edx
     caa:	85 ff                	test   %edi,%edi
}
     cac:	5f                   	pop    %edi
     cad:	5d                   	pop    %ebp
    return (neg ? -val : val);
     cae:	0f 45 c2             	cmovne %edx,%eax
}
     cb1:	c3                   	ret    
     cb2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        else if (*s >= 'A' && *s <= 'Z')
     cb8:	8d 72 bf             	lea    -0x41(%edx),%esi
     cbb:	89 f3                	mov    %esi,%ebx
     cbd:	80 fb 19             	cmp    $0x19,%bl
     cc0:	77 d6                	ja     c98 <strtol+0x98>
            dig = *s - 'A' + 10;
     cc2:	83 ea 37             	sub    $0x37,%edx
     cc5:	eb a4                	jmp    c6b <strtol+0x6b>
     cc7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     cce:	66 90                	xchg   %ax,%ax
        s++, neg = 1;
     cd0:	83 c1 01             	add    $0x1,%ecx
     cd3:	bf 01 00 00 00       	mov    $0x1,%edi
     cd8:	e9 64 ff ff ff       	jmp    c41 <strtol+0x41>
     cdd:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
     ce0:	83 c1 01             	add    $0x1,%ecx
    int neg = 0;
     ce3:	31 ff                	xor    %edi,%edi
     ce5:	e9 57 ff ff ff       	jmp    c41 <strtol+0x41>
     cea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
     cf0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
     cf4:	3c 78                	cmp    $0x78,%al
     cf6:	74 18                	je     d10 <strtol+0x110>
    else if (base == 0 && s[0] == '0')
     cf8:	85 db                	test   %ebx,%ebx
     cfa:	0f 85 5e ff ff ff    	jne    c5e <strtol+0x5e>
        s++, base = 8;
     d00:	83 c1 01             	add    $0x1,%ecx
     d03:	0f be d0             	movsbl %al,%edx
     d06:	bb 08 00 00 00       	mov    $0x8,%ebx
     d0b:	e9 4e ff ff ff       	jmp    c5e <strtol+0x5e>
        s += 2, base = 16;
     d10:	0f be 51 02          	movsbl 0x2(%ecx),%edx
     d14:	bb 10 00 00 00       	mov    $0x10,%ebx
     d19:	83 c1 02             	add    $0x2,%ecx
     d1c:	e9 3d ff ff ff       	jmp    c5e <strtol+0x5e>
     d21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d28:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d2f:	90                   	nop

00000d30 <ip_addr_pton>:

int
ip_addr_pton (const char *p, ip_addr_t *n) {
     d30:	f3 0f 1e fb          	endbr32 
     d34:	55                   	push   %ebp
     d35:	89 e5                	mov    %esp,%ebp
     d37:	57                   	push   %edi
    char *sp, *ep;
    int idx;
    long ret;

    sp = (char *)p;
    for (idx = 0; idx < 4; idx++) {
     d38:	31 ff                	xor    %edi,%edi
ip_addr_pton (const char *p, ip_addr_t *n) {
     d3a:	56                   	push   %esi
     d3b:	53                   	push   %ebx
     d3c:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
     d3f:	83 ec 1c             	sub    $0x1c,%esp
     d42:	8b 75 08             	mov    0x8(%ebp),%esi
        ret = strtol(sp, &ep, 10);
     d45:	83 ec 04             	sub    $0x4,%esp
     d48:	6a 0a                	push   $0xa
     d4a:	53                   	push   %ebx
     d4b:	56                   	push   %esi
     d4c:	e8 af fe ff ff       	call   c00 <strtol>
        if (ret < 0 || ret > 255) {
     d51:	83 c4 10             	add    $0x10,%esp
     d54:	3d ff 00 00 00       	cmp    $0xff,%eax
     d59:	77 3d                	ja     d98 <ip_addr_pton+0x68>
            return -1;
        }
        if (ep == sp) {
     d5b:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
     d5e:	39 f1                	cmp    %esi,%ecx
     d60:	74 36                	je     d98 <ip_addr_pton+0x68>
            return -1;
        }
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
     d62:	0f b6 11             	movzbl (%ecx),%edx
     d65:	83 ff 03             	cmp    $0x3,%edi
     d68:	74 16                	je     d80 <ip_addr_pton+0x50>
     d6a:	80 fa 2e             	cmp    $0x2e,%dl
     d6d:	75 29                	jne    d98 <ip_addr_pton+0x68>
            return -1;
        }
        ((uint8_t *)n)[idx] = ret;
     d6f:	8b 55 0c             	mov    0xc(%ebp),%edx
        sp = ep + 1;
     d72:	8d 71 01             	lea    0x1(%ecx),%esi
        ((uint8_t *)n)[idx] = ret;
     d75:	88 04 3a             	mov    %al,(%edx,%edi,1)
    for (idx = 0; idx < 4; idx++) {
     d78:	83 c7 01             	add    $0x1,%edi
     d7b:	eb c8                	jmp    d45 <ip_addr_pton+0x15>
     d7d:	8d 76 00             	lea    0x0(%esi),%esi
        if ((idx == 3 && *ep != '\0') || (idx != 3 && *ep != '.')) {
     d80:	84 d2                	test   %dl,%dl
     d82:	75 14                	jne    d98 <ip_addr_pton+0x68>
        ((uint8_t *)n)[idx] = ret;
     d84:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     d87:	88 43 03             	mov    %al,0x3(%ebx)
    }
    return 0;
}
     d8a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
     d8d:	31 c0                	xor    %eax,%eax
}
     d8f:	5b                   	pop    %ebx
     d90:	5e                   	pop    %esi
     d91:	5f                   	pop    %edi
     d92:	5d                   	pop    %ebp
     d93:	c3                   	ret    
     d94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     d98:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return -1;
     d9b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
     da0:	5b                   	pop    %ebx
     da1:	5e                   	pop    %esi
     da2:	5f                   	pop    %edi
     da3:	5d                   	pop    %ebp
     da4:	c3                   	ret    

00000da5 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     da5:	b8 01 00 00 00       	mov    $0x1,%eax
     daa:	cd 40                	int    $0x40
     dac:	c3                   	ret    

00000dad <exit>:
SYSCALL(exit)
     dad:	b8 02 00 00 00       	mov    $0x2,%eax
     db2:	cd 40                	int    $0x40
     db4:	c3                   	ret    

00000db5 <wait>:
SYSCALL(wait)
     db5:	b8 03 00 00 00       	mov    $0x3,%eax
     dba:	cd 40                	int    $0x40
     dbc:	c3                   	ret    

00000dbd <pipe>:
SYSCALL(pipe)
     dbd:	b8 04 00 00 00       	mov    $0x4,%eax
     dc2:	cd 40                	int    $0x40
     dc4:	c3                   	ret    

00000dc5 <read>:
SYSCALL(read)
     dc5:	b8 05 00 00 00       	mov    $0x5,%eax
     dca:	cd 40                	int    $0x40
     dcc:	c3                   	ret    

00000dcd <write>:
SYSCALL(write)
     dcd:	b8 10 00 00 00       	mov    $0x10,%eax
     dd2:	cd 40                	int    $0x40
     dd4:	c3                   	ret    

00000dd5 <close>:
SYSCALL(close)
     dd5:	b8 15 00 00 00       	mov    $0x15,%eax
     dda:	cd 40                	int    $0x40
     ddc:	c3                   	ret    

00000ddd <kill>:
SYSCALL(kill)
     ddd:	b8 06 00 00 00       	mov    $0x6,%eax
     de2:	cd 40                	int    $0x40
     de4:	c3                   	ret    

00000de5 <exec>:
SYSCALL(exec)
     de5:	b8 07 00 00 00       	mov    $0x7,%eax
     dea:	cd 40                	int    $0x40
     dec:	c3                   	ret    

00000ded <open>:
SYSCALL(open)
     ded:	b8 0f 00 00 00       	mov    $0xf,%eax
     df2:	cd 40                	int    $0x40
     df4:	c3                   	ret    

00000df5 <mknod>:
SYSCALL(mknod)
     df5:	b8 11 00 00 00       	mov    $0x11,%eax
     dfa:	cd 40                	int    $0x40
     dfc:	c3                   	ret    

00000dfd <unlink>:
SYSCALL(unlink)
     dfd:	b8 12 00 00 00       	mov    $0x12,%eax
     e02:	cd 40                	int    $0x40
     e04:	c3                   	ret    

00000e05 <fstat>:
SYSCALL(fstat)
     e05:	b8 08 00 00 00       	mov    $0x8,%eax
     e0a:	cd 40                	int    $0x40
     e0c:	c3                   	ret    

00000e0d <link>:
SYSCALL(link)
     e0d:	b8 13 00 00 00       	mov    $0x13,%eax
     e12:	cd 40                	int    $0x40
     e14:	c3                   	ret    

00000e15 <mkdir>:
SYSCALL(mkdir)
     e15:	b8 14 00 00 00       	mov    $0x14,%eax
     e1a:	cd 40                	int    $0x40
     e1c:	c3                   	ret    

00000e1d <chdir>:
SYSCALL(chdir)
     e1d:	b8 09 00 00 00       	mov    $0x9,%eax
     e22:	cd 40                	int    $0x40
     e24:	c3                   	ret    

00000e25 <dup>:
SYSCALL(dup)
     e25:	b8 0a 00 00 00       	mov    $0xa,%eax
     e2a:	cd 40                	int    $0x40
     e2c:	c3                   	ret    

00000e2d <getpid>:
SYSCALL(getpid)
     e2d:	b8 0b 00 00 00       	mov    $0xb,%eax
     e32:	cd 40                	int    $0x40
     e34:	c3                   	ret    

00000e35 <sbrk>:
SYSCALL(sbrk)
     e35:	b8 0c 00 00 00       	mov    $0xc,%eax
     e3a:	cd 40                	int    $0x40
     e3c:	c3                   	ret    

00000e3d <sleep>:
SYSCALL(sleep)
     e3d:	b8 0d 00 00 00       	mov    $0xd,%eax
     e42:	cd 40                	int    $0x40
     e44:	c3                   	ret    

00000e45 <uptime>:
SYSCALL(uptime)
     e45:	b8 0e 00 00 00       	mov    $0xe,%eax
     e4a:	cd 40                	int    $0x40
     e4c:	c3                   	ret    

00000e4d <ioctl>:
# iotcl
SYSCALL(ioctl)
     e4d:	b8 16 00 00 00       	mov    $0x16,%eax
     e52:	cd 40                	int    $0x40
     e54:	c3                   	ret    

00000e55 <socket>:
# socket
SYSCALL(socket)
     e55:	b8 17 00 00 00       	mov    $0x17,%eax
     e5a:	cd 40                	int    $0x40
     e5c:	c3                   	ret    

00000e5d <bind>:
SYSCALL(bind)
     e5d:	b8 19 00 00 00       	mov    $0x19,%eax
     e62:	cd 40                	int    $0x40
     e64:	c3                   	ret    

00000e65 <listen>:
SYSCALL(listen)
     e65:	b8 1a 00 00 00       	mov    $0x1a,%eax
     e6a:	cd 40                	int    $0x40
     e6c:	c3                   	ret    

00000e6d <accept>:
SYSCALL(accept)
     e6d:	b8 1b 00 00 00       	mov    $0x1b,%eax
     e72:	cd 40                	int    $0x40
     e74:	c3                   	ret    

00000e75 <recv>:
SYSCALL(recv)
     e75:	b8 1c 00 00 00       	mov    $0x1c,%eax
     e7a:	cd 40                	int    $0x40
     e7c:	c3                   	ret    

00000e7d <send>:
SYSCALL(send)
     e7d:	b8 1d 00 00 00       	mov    $0x1d,%eax
     e82:	cd 40                	int    $0x40
     e84:	c3                   	ret    

00000e85 <recvfrom>:
SYSCALL(recvfrom)
     e85:	b8 1e 00 00 00       	mov    $0x1e,%eax
     e8a:	cd 40                	int    $0x40
     e8c:	c3                   	ret    

00000e8d <sendto>:
SYSCALL(sendto)
     e8d:	b8 1f 00 00 00       	mov    $0x1f,%eax
     e92:	cd 40                	int    $0x40
     e94:	c3                   	ret    
     e95:	66 90                	xchg   %ax,%ax
     e97:	66 90                	xchg   %ax,%ax
     e99:	66 90                	xchg   %ax,%ax
     e9b:	66 90                	xchg   %ax,%ax
     e9d:	66 90                	xchg   %ax,%ax
     e9f:	90                   	nop

00000ea0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     ea0:	55                   	push   %ebp
     ea1:	89 e5                	mov    %esp,%ebp
     ea3:	57                   	push   %edi
     ea4:	56                   	push   %esi
     ea5:	53                   	push   %ebx
     ea6:	83 ec 3c             	sub    $0x3c,%esp
     ea9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
     eac:	89 d1                	mov    %edx,%ecx
{
     eae:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
     eb1:	85 d2                	test   %edx,%edx
     eb3:	0f 89 7f 00 00 00    	jns    f38 <printint+0x98>
     eb9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
     ebd:	74 79                	je     f38 <printint+0x98>
    neg = 1;
     ebf:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
     ec6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
     ec8:	31 db                	xor    %ebx,%ebx
     eca:	8d 75 d7             	lea    -0x29(%ebp),%esi
     ecd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     ed0:	89 c8                	mov    %ecx,%eax
     ed2:	31 d2                	xor    %edx,%edx
     ed4:	89 cf                	mov    %ecx,%edi
     ed6:	f7 75 c4             	divl   -0x3c(%ebp)
     ed9:	0f b6 92 14 16 00 00 	movzbl 0x1614(%edx),%edx
     ee0:	89 45 c0             	mov    %eax,-0x40(%ebp)
     ee3:	89 d8                	mov    %ebx,%eax
     ee5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
     ee8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
     eeb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
     eee:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
     ef1:	76 dd                	jbe    ed0 <printint+0x30>
  if(neg)
     ef3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
     ef6:	85 c9                	test   %ecx,%ecx
     ef8:	74 0c                	je     f06 <printint+0x66>
    buf[i++] = '-';
     efa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
     eff:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
     f01:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
     f06:	8b 7d b8             	mov    -0x48(%ebp),%edi
     f09:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
     f0d:	eb 07                	jmp    f16 <printint+0x76>
     f0f:	90                   	nop
     f10:	0f b6 13             	movzbl (%ebx),%edx
     f13:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
     f16:	83 ec 04             	sub    $0x4,%esp
     f19:	88 55 d7             	mov    %dl,-0x29(%ebp)
     f1c:	6a 01                	push   $0x1
     f1e:	56                   	push   %esi
     f1f:	57                   	push   %edi
     f20:	e8 a8 fe ff ff       	call   dcd <write>
  while(--i >= 0)
     f25:	83 c4 10             	add    $0x10,%esp
     f28:	39 de                	cmp    %ebx,%esi
     f2a:	75 e4                	jne    f10 <printint+0x70>
    putc(fd, buf[i]);
}
     f2c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f2f:	5b                   	pop    %ebx
     f30:	5e                   	pop    %esi
     f31:	5f                   	pop    %edi
     f32:	5d                   	pop    %ebp
     f33:	c3                   	ret    
     f34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
     f38:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
     f3f:	eb 87                	jmp    ec8 <printint+0x28>
     f41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     f48:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     f4f:	90                   	nop

00000f50 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
     f50:	f3 0f 1e fb          	endbr32 
     f54:	55                   	push   %ebp
     f55:	89 e5                	mov    %esp,%ebp
     f57:	57                   	push   %edi
     f58:	56                   	push   %esi
     f59:	53                   	push   %ebx
     f5a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     f5d:	8b 75 0c             	mov    0xc(%ebp),%esi
     f60:	0f b6 1e             	movzbl (%esi),%ebx
     f63:	84 db                	test   %bl,%bl
     f65:	0f 84 b4 00 00 00    	je     101f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
     f6b:	8d 45 10             	lea    0x10(%ebp),%eax
     f6e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
     f71:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
     f74:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
     f76:	89 45 d0             	mov    %eax,-0x30(%ebp)
     f79:	eb 33                	jmp    fae <printf+0x5e>
     f7b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     f7f:	90                   	nop
     f80:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
     f83:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
     f88:	83 f8 25             	cmp    $0x25,%eax
     f8b:	74 17                	je     fa4 <printf+0x54>
  write(fd, &c, 1);
     f8d:	83 ec 04             	sub    $0x4,%esp
     f90:	88 5d e7             	mov    %bl,-0x19(%ebp)
     f93:	6a 01                	push   $0x1
     f95:	57                   	push   %edi
     f96:	ff 75 08             	pushl  0x8(%ebp)
     f99:	e8 2f fe ff ff       	call   dcd <write>
     f9e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
     fa1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
     fa4:	0f b6 1e             	movzbl (%esi),%ebx
     fa7:	83 c6 01             	add    $0x1,%esi
     faa:	84 db                	test   %bl,%bl
     fac:	74 71                	je     101f <printf+0xcf>
    c = fmt[i] & 0xff;
     fae:	0f be cb             	movsbl %bl,%ecx
     fb1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
     fb4:	85 d2                	test   %edx,%edx
     fb6:	74 c8                	je     f80 <printf+0x30>
      }
    } else if(state == '%'){
     fb8:	83 fa 25             	cmp    $0x25,%edx
     fbb:	75 e7                	jne    fa4 <printf+0x54>
      if(c == 'd'){
     fbd:	83 f8 64             	cmp    $0x64,%eax
     fc0:	0f 84 9a 00 00 00    	je     1060 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
     fc6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
     fcc:	83 f9 70             	cmp    $0x70,%ecx
     fcf:	74 5f                	je     1030 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
     fd1:	83 f8 73             	cmp    $0x73,%eax
     fd4:	0f 84 d6 00 00 00    	je     10b0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     fda:	83 f8 63             	cmp    $0x63,%eax
     fdd:	0f 84 8d 00 00 00    	je     1070 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
     fe3:	83 f8 25             	cmp    $0x25,%eax
     fe6:	0f 84 b4 00 00 00    	je     10a0 <printf+0x150>
  write(fd, &c, 1);
     fec:	83 ec 04             	sub    $0x4,%esp
     fef:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     ff3:	6a 01                	push   $0x1
     ff5:	57                   	push   %edi
     ff6:	ff 75 08             	pushl  0x8(%ebp)
     ff9:	e8 cf fd ff ff       	call   dcd <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
     ffe:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    1001:	83 c4 0c             	add    $0xc,%esp
    1004:	6a 01                	push   $0x1
    1006:	83 c6 01             	add    $0x1,%esi
    1009:	57                   	push   %edi
    100a:	ff 75 08             	pushl  0x8(%ebp)
    100d:	e8 bb fd ff ff       	call   dcd <write>
  for(i = 0; fmt[i]; i++){
    1012:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
    1016:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    1019:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    101b:	84 db                	test   %bl,%bl
    101d:	75 8f                	jne    fae <printf+0x5e>
    }
  }
}
    101f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1022:	5b                   	pop    %ebx
    1023:	5e                   	pop    %esi
    1024:	5f                   	pop    %edi
    1025:	5d                   	pop    %ebp
    1026:	c3                   	ret    
    1027:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    102e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1030:	83 ec 0c             	sub    $0xc,%esp
    1033:	b9 10 00 00 00       	mov    $0x10,%ecx
    1038:	6a 00                	push   $0x0
    103a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    103d:	8b 45 08             	mov    0x8(%ebp),%eax
    1040:	8b 13                	mov    (%ebx),%edx
    1042:	e8 59 fe ff ff       	call   ea0 <printint>
        ap++;
    1047:	89 d8                	mov    %ebx,%eax
    1049:	83 c4 10             	add    $0x10,%esp
      state = 0;
    104c:	31 d2                	xor    %edx,%edx
        ap++;
    104e:	83 c0 04             	add    $0x4,%eax
    1051:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1054:	e9 4b ff ff ff       	jmp    fa4 <printf+0x54>
    1059:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
    1060:	83 ec 0c             	sub    $0xc,%esp
    1063:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1068:	6a 01                	push   $0x1
    106a:	eb ce                	jmp    103a <printf+0xea>
    106c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1070:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    1073:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1076:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
    1078:	6a 01                	push   $0x1
        ap++;
    107a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
    107d:	57                   	push   %edi
    107e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
    1081:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1084:	e8 44 fd ff ff       	call   dcd <write>
        ap++;
    1089:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    108c:	83 c4 10             	add    $0x10,%esp
      state = 0;
    108f:	31 d2                	xor    %edx,%edx
    1091:	e9 0e ff ff ff       	jmp    fa4 <printf+0x54>
    1096:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    109d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
    10a0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    10a3:	83 ec 04             	sub    $0x4,%esp
    10a6:	e9 59 ff ff ff       	jmp    1004 <printf+0xb4>
    10ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10af:	90                   	nop
        s = (char*)*ap;
    10b0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    10b3:	8b 18                	mov    (%eax),%ebx
        ap++;
    10b5:	83 c0 04             	add    $0x4,%eax
    10b8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    10bb:	85 db                	test   %ebx,%ebx
    10bd:	74 17                	je     10d6 <printf+0x186>
        while(*s != 0){
    10bf:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    10c2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    10c4:	84 c0                	test   %al,%al
    10c6:	0f 84 d8 fe ff ff    	je     fa4 <printf+0x54>
    10cc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    10cf:	89 de                	mov    %ebx,%esi
    10d1:	8b 5d 08             	mov    0x8(%ebp),%ebx
    10d4:	eb 1a                	jmp    10f0 <printf+0x1a0>
          s = "(null)";
    10d6:	bb 0c 16 00 00       	mov    $0x160c,%ebx
        while(*s != 0){
    10db:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    10de:	b8 28 00 00 00       	mov    $0x28,%eax
    10e3:	89 de                	mov    %ebx,%esi
    10e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
    10e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10ef:	90                   	nop
  write(fd, &c, 1);
    10f0:	83 ec 04             	sub    $0x4,%esp
          s++;
    10f3:	83 c6 01             	add    $0x1,%esi
    10f6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    10f9:	6a 01                	push   $0x1
    10fb:	57                   	push   %edi
    10fc:	53                   	push   %ebx
    10fd:	e8 cb fc ff ff       	call   dcd <write>
        while(*s != 0){
    1102:	0f b6 06             	movzbl (%esi),%eax
    1105:	83 c4 10             	add    $0x10,%esp
    1108:	84 c0                	test   %al,%al
    110a:	75 e4                	jne    10f0 <printf+0x1a0>
    110c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    110f:	31 d2                	xor    %edx,%edx
    1111:	e9 8e fe ff ff       	jmp    fa4 <printf+0x54>
    1116:	66 90                	xchg   %ax,%ax
    1118:	66 90                	xchg   %ax,%ax
    111a:	66 90                	xchg   %ax,%ax
    111c:	66 90                	xchg   %ax,%ax
    111e:	66 90                	xchg   %ax,%ax

00001120 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1120:	f3 0f 1e fb          	endbr32 
    1124:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1125:	a1 98 1a 00 00       	mov    0x1a98,%eax
{
    112a:	89 e5                	mov    %esp,%ebp
    112c:	57                   	push   %edi
    112d:	56                   	push   %esi
    112e:	53                   	push   %ebx
    112f:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1132:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
    1134:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1137:	39 c8                	cmp    %ecx,%eax
    1139:	73 15                	jae    1150 <free+0x30>
    113b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    113f:	90                   	nop
    1140:	39 d1                	cmp    %edx,%ecx
    1142:	72 14                	jb     1158 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1144:	39 d0                	cmp    %edx,%eax
    1146:	73 10                	jae    1158 <free+0x38>
{
    1148:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    114a:	8b 10                	mov    (%eax),%edx
    114c:	39 c8                	cmp    %ecx,%eax
    114e:	72 f0                	jb     1140 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1150:	39 d0                	cmp    %edx,%eax
    1152:	72 f4                	jb     1148 <free+0x28>
    1154:	39 d1                	cmp    %edx,%ecx
    1156:	73 f0                	jae    1148 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1158:	8b 73 fc             	mov    -0x4(%ebx),%esi
    115b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    115e:	39 fa                	cmp    %edi,%edx
    1160:	74 1e                	je     1180 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1162:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1165:	8b 50 04             	mov    0x4(%eax),%edx
    1168:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    116b:	39 f1                	cmp    %esi,%ecx
    116d:	74 28                	je     1197 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    116f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
    1171:	5b                   	pop    %ebx
  freep = p;
    1172:	a3 98 1a 00 00       	mov    %eax,0x1a98
}
    1177:	5e                   	pop    %esi
    1178:	5f                   	pop    %edi
    1179:	5d                   	pop    %ebp
    117a:	c3                   	ret    
    117b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    117f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
    1180:	03 72 04             	add    0x4(%edx),%esi
    1183:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1186:	8b 10                	mov    (%eax),%edx
    1188:	8b 12                	mov    (%edx),%edx
    118a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    118d:	8b 50 04             	mov    0x4(%eax),%edx
    1190:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1193:	39 f1                	cmp    %esi,%ecx
    1195:	75 d8                	jne    116f <free+0x4f>
    p->s.size += bp->s.size;
    1197:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    119a:	a3 98 1a 00 00       	mov    %eax,0x1a98
    p->s.size += bp->s.size;
    119f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    11a2:	8b 53 f8             	mov    -0x8(%ebx),%edx
    11a5:	89 10                	mov    %edx,(%eax)
}
    11a7:	5b                   	pop    %ebx
    11a8:	5e                   	pop    %esi
    11a9:	5f                   	pop    %edi
    11aa:	5d                   	pop    %ebp
    11ab:	c3                   	ret    
    11ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000011b0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    11b0:	f3 0f 1e fb          	endbr32 
    11b4:	55                   	push   %ebp
    11b5:	89 e5                	mov    %esp,%ebp
    11b7:	57                   	push   %edi
    11b8:	56                   	push   %esi
    11b9:	53                   	push   %ebx
    11ba:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    11bd:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    11c0:	8b 3d 98 1a 00 00    	mov    0x1a98,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    11c6:	8d 70 07             	lea    0x7(%eax),%esi
    11c9:	c1 ee 03             	shr    $0x3,%esi
    11cc:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    11cf:	85 ff                	test   %edi,%edi
    11d1:	0f 84 a9 00 00 00    	je     1280 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    11d7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
    11d9:	8b 48 04             	mov    0x4(%eax),%ecx
    11dc:	39 f1                	cmp    %esi,%ecx
    11de:	73 6d                	jae    124d <malloc+0x9d>
    11e0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    11e6:	bb 00 10 00 00       	mov    $0x1000,%ebx
    11eb:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    11ee:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
    11f5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    11f8:	eb 17                	jmp    1211 <malloc+0x61>
    11fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1200:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
    1202:	8b 4a 04             	mov    0x4(%edx),%ecx
    1205:	39 f1                	cmp    %esi,%ecx
    1207:	73 4f                	jae    1258 <malloc+0xa8>
    1209:	8b 3d 98 1a 00 00    	mov    0x1a98,%edi
    120f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1211:	39 c7                	cmp    %eax,%edi
    1213:	75 eb                	jne    1200 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
    1215:	83 ec 0c             	sub    $0xc,%esp
    1218:	ff 75 e4             	pushl  -0x1c(%ebp)
    121b:	e8 15 fc ff ff       	call   e35 <sbrk>
  if(p == (char*)-1)
    1220:	83 c4 10             	add    $0x10,%esp
    1223:	83 f8 ff             	cmp    $0xffffffff,%eax
    1226:	74 1b                	je     1243 <malloc+0x93>
  hp->s.size = nu;
    1228:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    122b:	83 ec 0c             	sub    $0xc,%esp
    122e:	83 c0 08             	add    $0x8,%eax
    1231:	50                   	push   %eax
    1232:	e8 e9 fe ff ff       	call   1120 <free>
  return freep;
    1237:	a1 98 1a 00 00       	mov    0x1a98,%eax
      if((p = morecore(nunits)) == 0)
    123c:	83 c4 10             	add    $0x10,%esp
    123f:	85 c0                	test   %eax,%eax
    1241:	75 bd                	jne    1200 <malloc+0x50>
        return 0;
  }
}
    1243:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    1246:	31 c0                	xor    %eax,%eax
}
    1248:	5b                   	pop    %ebx
    1249:	5e                   	pop    %esi
    124a:	5f                   	pop    %edi
    124b:	5d                   	pop    %ebp
    124c:	c3                   	ret    
    if(p->s.size >= nunits){
    124d:	89 c2                	mov    %eax,%edx
    124f:	89 f8                	mov    %edi,%eax
    1251:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    1258:	39 ce                	cmp    %ecx,%esi
    125a:	74 54                	je     12b0 <malloc+0x100>
        p->s.size -= nunits;
    125c:	29 f1                	sub    %esi,%ecx
    125e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
    1261:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
    1264:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
    1267:	a3 98 1a 00 00       	mov    %eax,0x1a98
}
    126c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    126f:	8d 42 08             	lea    0x8(%edx),%eax
}
    1272:	5b                   	pop    %ebx
    1273:	5e                   	pop    %esi
    1274:	5f                   	pop    %edi
    1275:	5d                   	pop    %ebp
    1276:	c3                   	ret    
    1277:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    127e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
    1280:	c7 05 98 1a 00 00 9c 	movl   $0x1a9c,0x1a98
    1287:	1a 00 00 
    base.s.size = 0;
    128a:	bf 9c 1a 00 00       	mov    $0x1a9c,%edi
    base.s.ptr = freep = prevp = &base;
    128f:	c7 05 9c 1a 00 00 9c 	movl   $0x1a9c,0x1a9c
    1296:	1a 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1299:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
    129b:	c7 05 a0 1a 00 00 00 	movl   $0x0,0x1aa0
    12a2:	00 00 00 
    if(p->s.size >= nunits){
    12a5:	e9 36 ff ff ff       	jmp    11e0 <malloc+0x30>
    12aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    12b0:	8b 0a                	mov    (%edx),%ecx
    12b2:	89 08                	mov    %ecx,(%eax)
    12b4:	eb b1                	jmp    1267 <malloc+0xb7>
