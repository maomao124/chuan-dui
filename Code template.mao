
代码模板：
by mao
作者QQ1296193245

main.cpp
/*   *************************************                                             //全屏图形窗口模板
	int rw, rh;
	rw = GetSystemMetrics(SM_CXSCREEN);                                          // 屏幕宽度 像素
	rh = GetSystemMetrics(SM_CYSCREEN);                                          // 屏幕高度 像素
	HWND hwnd = initgraph(rw, rh);                                                    // 初始化绘图窗口并获取窗口句柄
	setbkcolor(GREEN);
	cleardevice();
	LONG l_WinStyle = GetWindowLong(hwnd, GWL_STYLE);               // 获取窗口信息
																										 // 设置窗口信息 最大化 取消标题栏及边框
	SetWindowLong(hwnd, GWL_STYLE, (l_WinStyle | WS_POPUP | WS_MAXIMIZE) & ~WS_CAPTION & ~WS_THICKFRAME & ~WS_BORDER);           // 修改窗口样式
	SetWindowPos(hwnd, HWND_TOP, 0, 0, rw, rh, 0);
	*/   //***********************************


	/*      ***********************************
	initgraph(1600, 900);
	setbkcolor(WHITE);
	cleardevice();
	*/  //***********************************


	/*    ***********************************                                             //后台方式运行，Unicode字符集改成多字节字符集
	HWND hwnd; if (hwnd = ::FindWindow("ConsoleWindowClass", NULL)) //找到控制台句柄
	{
		::ShowWindow(hwnd, SW_HIDE); //隐藏控制台窗口
	}
                                                                                                    //unicode字符集下：
	const char* sss = "ConsoleWindowClass";
	WCHAR wszName[200];
	memset(wszName, 0, sizeof(wszName));
	MultiByteToWideChar(CP_ACP, 0, sss, strlen(sss) + 1, wszName,
		sizeof(wszName) / sizeof(wszName[0]));
	HWND hwnd; if (hwnd = ::FindWindow(wszName, NULL)) //找到控制台句柄
	{
		::ShowWindow(hwnd, SW_HIDE); //隐藏控制台窗口
	}
	*/  //**********************************


	/*   *************************************
	constexpr int MIN = 1;                            //随机数
	constexpr int MAX = 100;
	constexpr int numm = 10;
	 random_device rd;
	default_random_engine eng(rd());
	uniform_int_distribution<int> distr(MIN, MAX);

	for (int n = 0; n < numm; ++n)
	{
		cout << distr(eng) << ",";
	}
	*/   //***********************************


	/*  //************************************
	SYSTEMTIME sys;                                    //获取系统时间
	GetLocalTime(&sys);
	cout << sys.wYear << "/" << sys.wMonth << "/" << sys.wDay << "      ";
	cout<< setfill('0') << setw(2) << sys.wHour << ":" << setfill('0') << setw(2) << sys.wMinute << ":" << setfill('0') << setw(2) << sys.wSecond << endl;
	*/   //***********************************


	/*   ************************************                            //微软TTS语音模板
	ISpVoice* pVoice = NULL;                                            //创建一个ISpVoice的空指针
	if (FAILED(::CoInitialize(NULL)))                                     //初始化COM编程环境
	{
		cout << "初始化COM环境失败！" << endl;
		return 0;
	}
	                                                                                   //获取ISpVoice接口对象：
	HRESULT hr = CoCreateInstance(CLSID_SpVoice, NULL, CLSCTX_ALL, IID_ISpVoice, (void**)&pVoice);
	if (SUCCEEDED(hr))                                                      //如果获取接口对象成功
	{
		char* szStr = (char*)malloc(200);
		sprintf(szStr, "你好，世界。");
		WCHAR wszClassName[200];
		memset(wszClassName, 0, sizeof(wszClassName));
		MultiByteToWideChar(CP_ACP, 0, szStr, strlen(szStr) + 1, wszClassName,
			sizeof(wszClassName) / sizeof(wszClassName[0]));
		hr = pVoice->Speak(wszClassName, 0, NULL);         //朗读
		
		pVoice->Release();                                                 //释放分配资源
		pVoice = NULL;                                                     //防止野指针
	}
	::CoUninitialize();                                                       //退出COM编程环境
	*/  //*********************************


	/*   **********************************                          //多线程模板
	void task()
    {
	//多线程代码
    }
	thread t(task);
	t.detach();
	*/   //*******************************


	/*   ************************************                                  //自定义控制台输出位置
	HANDLE hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
	COORD coordScreen = { 0, 0 };                                           //光标位置
	CONSOLE_SCREEN_BUFFER_INFO csbi;
	if (GetConsoleScreenBufferInfo(hConsole, &csbi))
	{
		printf("光标坐标:(%d,%d)\n", csbi.dwCursorPosition.X, csbi.dwCursorPosition.Y);
	}
	HANDLE   hStdout;
	COORD     cursorPos;                                                       //标准输出句柄
	hStdout = GetStdHandle(STD_OUTPUT_HANDLE);
	cursorPos.X = 0;
	cursorPos.Y = csbi.dwCursorPosition.Y + 1;
	SetConsoleCursorPosition(hStdout, cursorPos);
	cout << "第1行" << endl;
	*/  //*********************************



	//***************************************                               //隐藏密码
	char password[50];      //真正的密码存放处
	//string password;
	char pw[50], ch;
	printf("请输入密码:");
	int i = 0;
	while ((ch = _getch()) != '\r')
	{
		if (ch == '\b' && i > 0)
		{
			printf("\b \b");
			--i;
		}
		else if (ch != '\b')
		{
			pw[i++] = ch;
			printf("*");
		}
	}
	pw[i] = '\0';
	//password = pw;   //键盘输入的密码给密码存放处
	strcpy(password, pw);
	cout <<endl<< password << endl;
	//***************************************



	//***************************************



	//***************************************                        //API获取鼠标状态
	initgraph(1640, 980);		// 初始化绘图窗口
	HWND hwnd = GetHWnd();		// 获取绘图窗口句柄
	POINT point;
	TCHAR s[10];
	while (true)
	{
		GetCursorPos(&point);			// 获取鼠标指针位置（屏幕坐标）
		ScreenToClient(hwnd, &point);	// 将鼠标指针位置转换为窗口坐标
		// 获取鼠标按键状态可以用 GetAsyncKeyState 函数，这里不再详述。
		// 输出鼠标坐标
		sprintf(s, _T("x轴：%d    "), point.x);
		outtextxy(0, 0, s);
		sprintf(s, _T("y轴：%d    "), point.y);
		outtextxy(0, 20, s);
		// 适当延时
		Sleep(10);
	}
	//***********************************************************************



	//**************************************************************************                       //播放音乐
	// 打开音乐
	mciSendString(_T("open music.mp3 alias mymusic"), NULL, 0, NULL);
	outtextxy(0, 0, _T("按任意键开始播放"));
	_getch();
	// 播放音乐
	mciSendString(_T("play mymusic"), NULL, 0, NULL);
	outtextxy(0, 0, _T("按任意键停止播放"));
	_getch();
	// 停止播放并关闭音乐
	mciSendString(_T("stop mymusic"), NULL, 0, NULL);
	mciSendString(_T("close mymusic"), NULL, 0, NULL);
	//****************************************************************************



	//*********************************************************************************        退出弹窗提示
	int c;
	while (!_kbhit())
	{
		c=_getch();
		cout << c;
		// 按退出时，显示对话框咨询用户是否退出
		if (c == 27)
		{
			HWND wnd = GetHWnd();
			cout << "\a";
			if (MessageBox(wnd, _T("您要退出吗？"), _T("提醒"), MB_OKCANCEL | MB_ICONQUESTION) == IDOK)
				break;
		}
	}
	//********************************************************************************



	//********************************************************************************                          //彻底最大化控制台窗口
	HWND hwnd = GetForegroundWindow();
	int cx = GetSystemMetrics(SM_CXSCREEN);            /* 屏幕宽度 像素 */
	int cy = GetSystemMetrics(SM_CYSCREEN);            /* 屏幕高度 像素 */
	LONG l_WinStyle = GetWindowLong(hwnd, GWL_STYLE);   /* 获取窗口信息 */
	/* 设置窗口信息 最大化 取消标题栏及边框 */
	SetWindowLong(hwnd, GWL_STYLE, (l_WinStyle | WS_POPUP | WS_MAXIMIZE) & ~WS_CAPTION & ~WS_THICKFRAME & ~WS_BORDER);
	SetWindowPos(hwnd, HWND_TOP, 0, 0, cx+17, cy, 0);
	//********************************************************************************














库函数以及API函数：
	//C 库函数 int islower(int c) 检查所传的字符是否是小写字母。
	//如果 c 是一个小写字母，则该函数返回非零值（true），否则返回 0（false）
	//C 库函数 int isupper(int c) 检查所传的字符是否是大写字母。
	//如果 c 是一个大写字母，则该函数返回非零值（true），否则返回 0（false）
	//C 库函数 int tolower(int c) 把给定的字母转换为小写字母。
	//如果 c 有相对应的小写字母，则该函数返回 c 的小写字母，否则 c 保持不变。返回值是一个可被隐式转换为 char 类型的 int 值。
	//C 库函数 int toupper(int c) 把小写字母转换为大写字母。
	//如果 c 有相对应的大写字母，则该函数返回 c 的大写字母，否则 c 保持不变。返回值是一个可被隐式转换为 char 类型的 int 值。

1	//C 库函数 double acos(double x) 返回以弧度表示的 x 的反余弦。
	//x -- 介于 [-1,+1] 区间的浮点值。
	//该函数返回以弧度表示的 x 的反余弦，弧度区间为 [0, pi]。
	double x, ret, val;
#define PI 3.14159265
	cout << "请输入x的值，区间[-1,+1]" << endl;
	cin >> x;
	val = 180.0 / PI;
	ret = acos(x) * val;
	printf("%lf 的反余弦是 %lf 度，弧度：%lf", x, ret, acos(x));
2	//C 库函数 double asin(double x) 返回以弧度表示的 x 的反正弦。
	//x -- 介于 [-1,+1] 区间的浮点值
	//该函数返回以弧度表示的 x 的反正弦，弧度区间为 [-pi/2,+pi/2]
3   //C 库函数 double atan(double x) 返回以弧度表示的 x 的反正切。
	//x -- 浮点值。
	//该函数返回以弧度表示的 x 的反正切，弧度区间为 [-pi/2,+pi/2]。
4	//C 库函数 double atan2(double y, double x) 返回以弧度表示的 y/x 的反正切。y 和 x 的值的符号决定了正确的象限。
	//x -- 代表 x 轴坐标的浮点值。
	//y -- 代表 y 轴坐标的浮点值。
	//该函数返回以弧度表示的 y/x 的反正切，弧度区间为 [-pi,+pi]。
5	//C 库函数 double cos(double x) 返回弧度角 x 的余弦。
	//x -- 浮点值，代表了一个以弧度表示的角度。
	//该函数返回 x 的余弦。
6	//cosh(x)=（e^x+e^(-x）)/2                                                                   //双曲余弦
	cout << "公式：cosh(x)=（e^x+e^(-x）)/2" << endl;
	double x;
	cout << "请输入x的值：" << endl;
	cin >> x;
	printf("%lf 的双曲余弦是 %lf\n", x, cosh(x));
	//C 库函数 double sin(double x) 返回弧度角 x 的正弦。
7	//x -- 浮点值，代表了一个以弧度表示的角度
	//该函数返回 x 的正弦
8	//sinh(x)=（e^x-e^(-x)）/2                                                                    // 双曲正弦
	cout << "公式：sinh(x)=（e^x-e^(-x)）/2" << endl;
	double x, ret;
	cout << "请输入x的值：" << endl;
	cin >> x;
	ret = sinh(x);
	printf("%lf 的双曲正弦是 %lf ", x, ret);
9	//tanh（x）=（e^x-e^(-x）)/（e^x+e^(-x）)=sinh(x)/cosh(x）                //  双曲正切
	cout << "公式：tanh（x）=（e^x-e^(-x）)/（e^x+e^(-x）)=sinh(x)/cosh(x）" << endl;
	double x, ret;
	cout << "请输入x的值：" << endl;
	cin >> x;
	ret = tanh(x);
	printf("%lf 的双曲正切是 %lf ", x, ret);
10	//C 库函数 double exp(double x) 返回 e 的 x 次幂的值
	cout << "e 的 x 次幂" << endl;
	cout << "请输入x的值：" << endl;
	double x;
	cin >> x;
	printf("e 的 %lf 次幂是 %lf\n", x, exp(x));
11	//C 库函数 double frexp(double x, int *exponent) 把浮点数 x 分解成尾数和指数。返回值是尾数，并将指数存入 exponent 中。所得的值是 x = mantissa * 2 ^ exponent。
	//x -- 要被计算的浮点值。
	//exponent -- 指向一个对象的指针，该对象存储了指数的值。
	//该函数返回规格化小数。如果参数 x 不为零，则规格化小数是 x 的二次方，且它的绝对值范围从 1/2（包含）到 1（不包含）。如果 x 为零，则规格化小数是零，且零存储在 exp 中。
	double x, fraction;
	int e;
	cout << "请输入要分解的浮点数：" << endl;
	cin >> x;
	fraction = frexp(x, &e);
	cout << "尾数：" << fraction << endl;
	cout << "  阶：" << e << endl;
	printf("x = %.2lf = %.2lf * 2^%d\n", x, fraction, e);
12	//C 库函数 double ldexp(double x, int exponent) 返回 x 乘以 2 的 exponent 次幂。
	//x -- 代表有效位数的浮点值。
	//exponent -- 指数的值。
	cout << "x 乘以 2 的 exponent 次幂" << endl;
	double x, ret;
	int n;
	cout << "请分别输入x的值和exponent的值：" << endl;
	cin >> x >> n;
	ret = ldexp(x, n);
	cout <<"结果：" << x;
	printf(" * 2^%d = %f\n", n, ret);
13	//C 库函数 double log(double x) 返回 x 的自然对数（基数为 e 的对数）
	double x, ret;
	cout << "x 的自然对数" << endl;
	cout << "请输入x的值：" << endl;
	cin >> x;
	ret = log(x);
	printf("log(%lf) = %lf", x, ret);
14	//C 库函数 double log10(double x) 返回 x 的常用对数（基数为 10 的对数）
	//该函数返回 x 的常用对数，x 的值大于 0
15	//C 库函数 double modf(double x, double *integer) 返回值为小数部分（小数点后的部分），并设置 integer 为整数部分
	//x -- 浮点值。
	//integer -- 指向一个对象的指针，该对象存储了整数部分。
	double x, fractpart, intpart;
	cout << "请输入一个浮点数" << endl;
	cin >> x;
	fractpart = modf(x, &intpart);
	printf("整数部分 = %lf\n", intpart);
	printf("小数部分 = %lf \n", fractpart);
16	//C 库函数 double pow(double x, double y) 返回 x 的 y 次幂
17   //C 库函数 double sqrt(double x) 返回 x 的平方根。
18    //C 库函数 double fmod(double x, double y) 返回 x 除以 y 的余数
	cout << "计算 x 除以 y 的余数(支持浮点数)" << endl;
	double x, y;
	cout << "请输入x的值：";
	cin >> x;
	cout << "请输入y的值：";
	cin >> y;
	cout << "结果为：" << fmod(x, y) << endl;

1	//C 库函数 double atof(const char *str) 把参数 str 所指向的字符串转换为一个浮点数（类型为 double 型）
	//函数返回转换后的双精度浮点数，如果没有执行有效的转换，则返回零（0.0）
	double val;
	char str[20];
	strcpy(str, "123456789");
	val = atof(str);
	printf("字符串值 = %s, 浮点值 = %f\n", str, val);
	strcpy(str, "213run125");
	val = atof(str);
	printf("字符串值 = %s, 浮点值 = %f\n", str, val);
2	//C 库函数 int atoi(const char *str) 把参数 str 所指向的字符串转换为一个整数（类型为 int 型）
	//该函数返回转换后的长整数，如果没有执行有效的转换，则返回零
3	//C 库函数 long int atol(const char *str) 把参数 str 所指向的字符串转换为一个长整数（类型为 long int 型）
4	//C 库函数 unsigned long int strtoul(const char *str, char **endptr, int base) 把参数 str 所指向的字符串根据给定的 base 转换为一个无符号长整数
	//（类型为 unsigned long int 型），base 必须介于 2 和 36（包含）之间，或者是特殊值 0
	  //str -- 要转换为无符号长整数的字符串。
		//endptr -- 对类型为 char* 的对象的引用，其值由函数设置为 str 中数值后的下一个字符。
		//base -- 基数，必须介于 2 和 36（包含）之间，或者是特殊值 0。
	char str[30] = "2030300 This is test";
	char* ptr;
	long ret;
	ret = strtoul(str, &ptr, 10);
	printf("数字（无符号长整数）是 %lu\n", ret);
	printf("字符串部分是 %s", ptr);
5	//C 库函数 size_t wcstombs(char *str, const wchar_t *pwcs, size_t n) 把宽字符字符串 pwcs 转换为一个 str 开始的多字节字符串。最多会有 n 个字节被写入 str 中
	//str -- 指向一个 char 元素的数组，至少有 n 字节长。
	//pwcs -- 要被转换的宽字符字符串。
    //n -- 要被写入到 str 中的最大字节数。
	size_t ret;
	char* MB = (char*)malloc(50);
	const wchar_t* WC = L"12389756";
	/* 转换宽字符字符串 */
	ret = wcstombs(MB, WC, 50);
	printf("要转换的字符数 = %u\n", ret);
	printf("多字节字符 = %s\n\n", MB);

	颜色渐变：
	setfillcolor(HSLtoRGB(a, 1, 0.5));                 //a的区间：[0,359]
	 获取图像：
	IMAGE img;
	loadimage(&img, _T("test.png"));
	显示图像：
	putimage(0, 0, &img);
	保存图像：
	saveimage(_T("textout.jpg"), &img);

	字符排序：
	char ch[20] = "sdasdacsdasdas";
    cout << ch << endl;
    sort(ch, ch + 14);
    cout << ch << endl;
	求绝对值：
	fabs(x);
	abs(x);
	元素反转：
	 int a[10] = { 10,11,12,13,14,15 };
    reverse(a, a + 4);
	赋相同值：
	 int a[10] = { 1,2,3,4,5 };
    fill(a, a + 5, 233);

	声音：
	Beep(1200, 300);                                                //第一个参数是音调，第二个参数是发声时间，单位是毫秒
	多线程模式：
	void voicebeep()
   {
	Beep(800, 3000);
   }
   thread t(voicebeep);                             //主函数里
	t.detach();





















	function.cpp
	/*   ****************************************
void FpsTime(const time_t* t0, time_t* t1, const time_t* t2)// 图形界面计算显示FPS和运行时间
{
	if (!t0 || !t1 || !t2)
		return;
	static int FPS = 0;
	static int fps = 0;
	static wstring fpsTime;
	if (*t2 - *t1 == 1)
	{
		FPS = ++fps;
	}
	fpsTime = L"FPS: ";
	fpsTime += to_wstring(FPS);
	fpsTime += L" 运行时间: ";
	fpsTime += to_wstring(*t2 - *t0);
	fpsTime += L"s";
	settextcolor(LIGHTMAGENTA);
	outtextxy(0, 0, fpsTime.c_str());

	if (*t2 - *t1 == 1)
	{
		fps = 0;
		*t1 = time(nullptr);
	}
	else
	{
		fps++;
	}
}
*/    //*************************************
/*bool cmp(const int a, const int b)
{
	return a > b;
}*/


/*    ***************************************
bool ChangeDisSize(int cx, int cy)	                                  // 分辨率设置为 cx × cy，退出程序时自动还原
{
	LPDIRECTDRAW DXW;
	HRESULT ddrval;
	ddrval = DirectDrawCreate(NULL, &DXW, NULL);
	if (DD_OK != DD_OK) return FALSE;	                         // 创建DirectDraw对象失败返回
	ddrval = DXW->SetCooperativeLevel(NULL, DDSCL_NORMAL);
	if (DD_OK != DD_OK) return FALSE;	                         // 取得窗口模式失败返回
	ddrval = DXW->SetDisplayMode(cx, cy, 16);
	if (DD_OK != DD_OK) return FALSE;	                          // 设置显示模式失败返回
}
*/

//**********************************************************************//密码加密解密算法
//单个字符异或运算
char MakecodeChar(char c, int key)
{
	return c = c ^ key;
}
//单个字符解密
char CutcodeChar(char c, int key)
{
	return c ^ key;
}
//加密
void Makecode(char* pstr, int* pkey)
{
	int len = strlen(pstr);//获取长度
	for (int i = 0;i < len;i++)
		*(pstr + i) = MakecodeChar(*(pstr + i), pkey[i % 5]);
}
//解密
void Cutecode(char* pstr, int* pkey)
{
	int len = strlen(pstr);
	for (int i = 0;i < len;i++)
		*(pstr + i) = CutcodeChar(*(pstr + i), pkey[i % 5]);
}


char* jiami(char s[])
{
	int key[] = { 1,2,3,4,5 };//加密字符

	char* p = s;
	Makecode(s, key);//加密
	return p;
}

char* jiemi1(char s[])
{
	int key[] = { 9,5,4,6,1 };//加密字符
	char* p = s;
	Cutecode(s, key);//解密
	return p;
}

char* jiemi2(char s[])
{
	int key[] = { 2,8,7,1,3 };//加密字符
	char* p = s;
	Cutecode(s, key);//解密
	return p;
}

char* jiemi22(char s[])
{
	int key[] = { 3,8,7,9,3 };//加密字符
	char* p = s;
	Cutecode(s, key);//解密
	return p;
}
//************************************************************************

























模块：
//*************************************************************************                  //散列算法 MD5  文件检验、密码加密等


	/* Type define */
	typedef unsigned char byte;
typedef unsigned long ulong;

using std::string;
using std::ifstream;

/* MD5 declaration. */
class MD5 {
public:
	MD5();
	MD5(const void* input, size_t length);
	MD5(const string& str);
	MD5(ifstream& in);
	void update(const void* input, size_t length);
	void update(const string& str);
	void update(ifstream& in);
	const byte* digest();
	string toString();
	void reset();
private:
	void update(const byte* input, size_t length);
	void final();
	void transform(const byte block[64]);
	void encode(const ulong* input, byte* output, size_t length);
	void decode(const byte* input, ulong* output, size_t length);
	string bytesToHexString(const byte* input, size_t length);

	/* class uncopyable */
	MD5(const MD5&);
	MD5& operator=(const MD5&);
private:
	ulong _state[4];	/* state (ABCD) */
	ulong _count[2];	/* number of bits, modulo 2^64 (low-order word first) */
	byte _buffer[64];	/* input buffer */
	byte _digest[16];	/* message digest */
	bool _finished;		/* calculate finished ? */

	static const byte PADDING[64];	/* padding for calculate */
	static const char HEX[16];
	static const size_t BUFFER_SIZE = 1024;
};


/* Constants for MD5Transform routine. */
#define S11 7
#define S12 12
#define S13 17
#define S14 22
#define S21 5
#define S22 9
#define S23 14
#define S24 20
#define S31 4
#define S32 11
#define S33 16
#define S34 23
#define S41 6
#define S42 10
#define S43 15
#define S44 21


/* F, G, H and I are basic MD5 functions.
*/
#define F(x, y, z) (((x) & (y)) | ((~x) & (z)))
#define G(x, y, z) (((x) & (z)) | ((y) & (~z)))
#define H(x, y, z) ((x) ^ (y) ^ (z))
#define I(x, y, z) ((y) ^ ((x) | (~z)))

/* ROTATE_LEFT rotates x left n bits.
*/
#define ROTATE_LEFT(x, n) (((x) << (n)) | ((x) >> (32-(n))))

/* FF, GG, HH, and II transformations for rounds 1, 2, 3, and 4.
Rotation is separate from addition to prevent recomputation.
*/
#define FF(a, b, c, d, x, s, ac) { \
	(a) += F ((b), (c), (d)) + (x) + ac; \
	(a) = ROTATE_LEFT ((a), (s)); \
	(a) += (b); \
}
#define GG(a, b, c, d, x, s, ac) { \
	(a) += G ((b), (c), (d)) + (x) + ac; \
	(a) = ROTATE_LEFT ((a), (s)); \
	(a) += (b); \
}
#define HH(a, b, c, d, x, s, ac) { \
	(a) += H ((b), (c), (d)) + (x) + ac; \
	(a) = ROTATE_LEFT ((a), (s)); \
	(a) += (b); \
}
#define II(a, b, c, d, x, s, ac) { \
	(a) += I ((b), (c), (d)) + (x) + ac; \
	(a) = ROTATE_LEFT ((a), (s)); \
	(a) += (b); \
}


const byte MD5::PADDING[64] = { 0x80 };
const char MD5::HEX[16] = {
	'0', '1', '2', '3',
	'4', '5', '6', '7',
	'8', '9', 'a', 'b',
	'c', 'd', 'e', 'f'
};

/* Default construct. */
MD5::MD5() {
	reset();
}

/* Construct a MD5 object with a input buffer. */
MD5::MD5(const void* input, size_t length) {
	reset();
	update(input, length);
}

/* Construct a MD5 object with a string. */
MD5::MD5(const string& str) {
	reset();
	update(str);
}

/* Construct a MD5 object with a file. */
MD5::MD5(ifstream& in) {
	reset();
	update(in);
}

/* Return the message-digest */
const byte* MD5::digest() {
	if (!_finished) {
		_finished = true;
		final();
	}
	return _digest;
}

/* Reset the calculate state */
void MD5::reset() {

	_finished = false;
	/* reset number of bits. */
	_count[0] = _count[1] = 0;
	/* Load magic initialization constants. */
	_state[0] = 0x67452301;
	_state[1] = 0xefcdab89;
	_state[2] = 0x98badcfe;
	_state[3] = 0x10325476;
}

/* Updating the context with a input buffer. */
void MD5::update(const void* input, size_t length) {
	update((const byte*)input, length);
}

/* Updating the context with a string. */
void MD5::update(const string& str) {
	update((const byte*)str.c_str(), str.length());
}

/* Updating the context with a file. */
void MD5::update(ifstream& in) {

	if (!in)
		return;

	std::streamsize length;
	char buffer[BUFFER_SIZE];
	while (!in.eof()) {
		in.read(buffer, BUFFER_SIZE);
		length = in.gcount();
		if (length > 0)
			update(buffer, length);
	}
	in.close();
}

/* MD5 block update operation. Continues an MD5 message-digest
operation, processing another message block, and updating the
context.
*/
void MD5::update(const byte* input, size_t length) {

	ulong i, index, partLen;

	_finished = false;

	/* Compute number of bytes mod 64 */
	index = (ulong)((_count[0] >> 3) & 0x3f);

	/* update number of bits */
	if ((_count[0] += ((ulong)length << 3)) < ((ulong)length << 3))
		_count[1]++;
	_count[1] += ((ulong)length >> 29);

	partLen = 64 - index;

	/* transform as many times as possible. */
	if (length >= partLen) {

		memcpy(&_buffer[index], input, partLen);
		transform(_buffer);

		for (i = partLen; i + 63 < length; i += 64)
			transform(&input[i]);
		index = 0;

	}
	else {
		i = 0;
	}

	/* Buffer remaining input */
	memcpy(&_buffer[index], &input[i], length - i);
}

/* MD5 finalization. Ends an MD5 message-_digest operation, writing the
the message _digest and zeroizing the context.
*/
void MD5::final() {

	byte bits[8];
	ulong oldState[4];
	ulong oldCount[2];
	ulong index, padLen;

	/* Save current state and count. */
	memcpy(oldState, _state, 16);
	memcpy(oldCount, _count, 8);

	/* Save number of bits */
	encode(_count, bits, 8);

	/* Pad out to 56 mod 64. */
	index = (ulong)((_count[0] >> 3) & 0x3f);
	padLen = (index < 56) ? (56 - index) : (120 - index);
	update(PADDING, padLen);

	/* Append length (before padding) */
	update(bits, 8);

	/* Store state in digest */
	encode(_state, _digest, 16);

	/* Restore current state and count. */
	memcpy(_state, oldState, 16);
	memcpy(_count, oldCount, 8);
}

/* MD5 basic transformation. Transforms _state based on block. */
void MD5::transform(const byte block[64]) {

	ulong a = _state[0], b = _state[1], c = _state[2], d = _state[3], x[16];

	decode(block, x, 64);

	/* Round 1 */
	FF(a, b, c, d, x[0], S11, 0xd76aa478); /* 1 */
	FF(d, a, b, c, x[1], S12, 0xe8c7b756); /* 2 */
	FF(c, d, a, b, x[2], S13, 0x242070db); /* 3 */
	FF(b, c, d, a, x[3], S14, 0xc1bdceee); /* 4 */
	FF(a, b, c, d, x[4], S11, 0xf57c0faf); /* 5 */
	FF(d, a, b, c, x[5], S12, 0x4787c62a); /* 6 */
	FF(c, d, a, b, x[6], S13, 0xa8304613); /* 7 */
	FF(b, c, d, a, x[7], S14, 0xfd469501); /* 8 */
	FF(a, b, c, d, x[8], S11, 0x698098d8); /* 9 */
	FF(d, a, b, c, x[9], S12, 0x8b44f7af); /* 10 */
	FF(c, d, a, b, x[10], S13, 0xffff5bb1); /* 11 */
	FF(b, c, d, a, x[11], S14, 0x895cd7be); /* 12 */
	FF(a, b, c, d, x[12], S11, 0x6b901122); /* 13 */
	FF(d, a, b, c, x[13], S12, 0xfd987193); /* 14 */
	FF(c, d, a, b, x[14], S13, 0xa679438e); /* 15 */
	FF(b, c, d, a, x[15], S14, 0x49b40821); /* 16 */

	/* Round 2 */
	GG(a, b, c, d, x[1], S21, 0xf61e2562); /* 17 */
	GG(d, a, b, c, x[6], S22, 0xc040b340); /* 18 */
	GG(c, d, a, b, x[11], S23, 0x265e5a51); /* 19 */
	GG(b, c, d, a, x[0], S24, 0xe9b6c7aa); /* 20 */
	GG(a, b, c, d, x[5], S21, 0xd62f105d); /* 21 */
	GG(d, a, b, c, x[10], S22, 0x2441453); /* 22 */
	GG(c, d, a, b, x[15], S23, 0xd8a1e681); /* 23 */
	GG(b, c, d, a, x[4], S24, 0xe7d3fbc8); /* 24 */
	GG(a, b, c, d, x[9], S21, 0x21e1cde6); /* 25 */
	GG(d, a, b, c, x[14], S22, 0xc33707d6); /* 26 */
	GG(c, d, a, b, x[3], S23, 0xf4d50d87); /* 27 */
	GG(b, c, d, a, x[8], S24, 0x455a14ed); /* 28 */
	GG(a, b, c, d, x[13], S21, 0xa9e3e905); /* 29 */
	GG(d, a, b, c, x[2], S22, 0xfcefa3f8); /* 30 */
	GG(c, d, a, b, x[7], S23, 0x676f02d9); /* 31 */
	GG(b, c, d, a, x[12], S24, 0x8d2a4c8a); /* 32 */

	/* Round 3 */
	HH(a, b, c, d, x[5], S31, 0xfffa3942); /* 33 */
	HH(d, a, b, c, x[8], S32, 0x8771f681); /* 34 */
	HH(c, d, a, b, x[11], S33, 0x6d9d6122); /* 35 */
	HH(b, c, d, a, x[14], S34, 0xfde5380c); /* 36 */
	HH(a, b, c, d, x[1], S31, 0xa4beea44); /* 37 */
	HH(d, a, b, c, x[4], S32, 0x4bdecfa9); /* 38 */
	HH(c, d, a, b, x[7], S33, 0xf6bb4b60); /* 39 */
	HH(b, c, d, a, x[10], S34, 0xbebfbc70); /* 40 */
	HH(a, b, c, d, x[13], S31, 0x289b7ec6); /* 41 */
	HH(d, a, b, c, x[0], S32, 0xeaa127fa); /* 42 */
	HH(c, d, a, b, x[3], S33, 0xd4ef3085); /* 43 */
	HH(b, c, d, a, x[6], S34, 0x4881d05); /* 44 */
	HH(a, b, c, d, x[9], S31, 0xd9d4d039); /* 45 */
	HH(d, a, b, c, x[12], S32, 0xe6db99e5); /* 46 */
	HH(c, d, a, b, x[15], S33, 0x1fa27cf8); /* 47 */
	HH(b, c, d, a, x[2], S34, 0xc4ac5665); /* 48 */

	/* Round 4 */
	II(a, b, c, d, x[0], S41, 0xf4292244); /* 49 */
	II(d, a, b, c, x[7], S42, 0x432aff97); /* 50 */
	II(c, d, a, b, x[14], S43, 0xab9423a7); /* 51 */
	II(b, c, d, a, x[5], S44, 0xfc93a039); /* 52 */
	II(a, b, c, d, x[12], S41, 0x655b59c3); /* 53 */
	II(d, a, b, c, x[3], S42, 0x8f0ccc92); /* 54 */
	II(c, d, a, b, x[10], S43, 0xffeff47d); /* 55 */
	II(b, c, d, a, x[1], S44, 0x85845dd1); /* 56 */
	II(a, b, c, d, x[8], S41, 0x6fa87e4f); /* 57 */
	II(d, a, b, c, x[15], S42, 0xfe2ce6e0); /* 58 */
	II(c, d, a, b, x[6], S43, 0xa3014314); /* 59 */
	II(b, c, d, a, x[13], S44, 0x4e0811a1); /* 60 */
	II(a, b, c, d, x[4], S41, 0xf7537e82); /* 61 */
	II(d, a, b, c, x[11], S42, 0xbd3af235); /* 62 */
	II(c, d, a, b, x[2], S43, 0x2ad7d2bb); /* 63 */
	II(b, c, d, a, x[9], S44, 0xeb86d391); /* 64 */

	_state[0] += a;
	_state[1] += b;
	_state[2] += c;
	_state[3] += d;
}

/* Encodes input (ulong) into output (byte). Assumes length is
a multiple of 4.
*/
void MD5::encode(const ulong* input, byte* output, size_t length) {

	for (size_t i = 0, j = 0; j < length; i++, j += 4) {
		output[j] = (byte)(input[i] & 0xff);
		output[j + 1] = (byte)((input[i] >> 8) & 0xff);
		output[j + 2] = (byte)((input[i] >> 16) & 0xff);
		output[j + 3] = (byte)((input[i] >> 24) & 0xff);
	}
}

/* Decodes input (byte) into output (ulong). Assumes length is
a multiple of 4.
*/
void MD5::decode(const byte* input, ulong* output, size_t length) {

	for (size_t i = 0, j = 0; j < length; i++, j += 4) {
		output[i] = ((ulong)input[j]) | (((ulong)input[j + 1]) << 8) |
			(((ulong)input[j + 2]) << 16) | (((ulong)input[j + 3]) << 24);
	}
}

/* Convert byte array to hex string. */
string MD5::bytesToHexString(const byte* input, size_t length) {
	string str;
	str.reserve(length << 1);
	for (size_t i = 0; i < length; i++) {
		int t = input[i];
		int a = t / 16;
		int b = t % 16;
		str.append(1, HEX[a]);
		str.append(1, HEX[b]);
	}
	return str;
}

/* Convert digest to string value */
string MD5::toString() {
	return bytesToHexString(digest(), 16);
}

void PrintMD5(const string& str, MD5& md5) {
	cout << "MD5(\"" << str << "\") = " << md5.toString() << endl;
}

string FileDigest(const string& file) {

	ifstream in(file.c_str(), ios::binary);
	if (!in)
		return "";

	MD5 md5;
	std::streamsize length;
	char buffer[1024];
	while (!in.eof()) {
		in.read(buffer, 1024);
		length = in.gcount();
		if (length > 0)
			md5.update(buffer, length);
	}
	in.close();
	return md5.toString();
}

主函数：
const char* s = "abc";
	 string s1= MD5(s).toString();
	 cout << s1 << endl;
	 string s2 = FileDigest("test.txt");
	cout << s2<< endl;
	if (s1 == s2)
	{
		cout << "相同" << endl;
	}
	else
	{
		cout << "不同" << endl;
	}
	//*****************************************************************


	//********************************************************************//散列算法 sha256 密码加密等
	
class SHA256
{
protected:
	typedef unsigned char uint8;
	typedef unsigned int uint32;
	typedef unsigned long long uint64;

	const static uint32 sha256_k[];
	static const unsigned int SHA224_256_BLOCK_SIZE = (512 / 8);
public:
	void init();
	void update(const unsigned char* message, unsigned int len);
	void final(unsigned char* digest);
	static const unsigned int DIGEST_SIZE = (256 / 8);

protected:
	void transform(const unsigned char* message, unsigned int block_nb);
	unsigned int m_tot_len;
	unsigned int m_len;
	unsigned char m_block[2 * SHA224_256_BLOCK_SIZE];
	uint32 m_h[8];
};

std::string sha256(std::string input);

#define SHA2_SHFR(x, n)    (x >> n)
#define SHA2_ROTR(x, n)   ((x >> n) | (x << ((sizeof(x) << 3) - n)))
#define SHA2_ROTL(x, n)   ((x << n) | (x >> ((sizeof(x) << 3) - n)))
#define SHA2_CH(x, y, z)  ((x & y) ^ (~x & z))
#define SHA2_MAJ(x, y, z) ((x & y) ^ (x & z) ^ (y & z))
#define SHA256_F1(x) (SHA2_ROTR(x,  2) ^ SHA2_ROTR(x, 13) ^ SHA2_ROTR(x, 22))
#define SHA256_F2(x) (SHA2_ROTR(x,  6) ^ SHA2_ROTR(x, 11) ^ SHA2_ROTR(x, 25))
#define SHA256_F3(x) (SHA2_ROTR(x,  7) ^ SHA2_ROTR(x, 18) ^ SHA2_SHFR(x,  3))
#define SHA256_F4(x) (SHA2_ROTR(x, 17) ^ SHA2_ROTR(x, 19) ^ SHA2_SHFR(x, 10))
#define SHA2_UNPACK32(x, str)                 \
{                                             \
    *((str) + 3) = (uint8) ((x)      );       \
    *((str) + 2) = (uint8) ((x) >>  8);       \
    *((str) + 1) = (uint8) ((x) >> 16);       \
    *((str) + 0) = (uint8) ((x) >> 24);       \
}
#define SHA2_PACK32(str, x)                   \
{                                             \
    *(x) =   ((uint32) *((str) + 3)      )    \
           | ((uint32) *((str) + 2) <<  8)    \
           | ((uint32) *((str) + 1) << 16)    \
           | ((uint32) *((str) + 0) << 24);   \
}
const unsigned int SHA256::sha256_k[64] = //UL = uint32
{ 0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5,
0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3,
0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc,
0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7,
0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13,
0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3,
0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5,
0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208,
0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2 };

void SHA256::transform(const unsigned char* message, unsigned int block_nb)
{
	uint32 w[64];
	uint32 wv[8];
	uint32 t1, t2;
	const unsigned char* sub_block;
	int i;
	int j;
	for (i = 0; i < (int)block_nb; i++) 
	{
		sub_block = message + (i << 6);
		for (j = 0; j < 16; j++) {
			SHA2_PACK32(&sub_block[j << 2], &w[j]);
		}
		for (j = 16; j < 64; j++) {
			w[j] = SHA256_F4(w[j - 2]) + w[j - 7] + SHA256_F3(w[j - 15]) + w[j - 16];
		}
		for (j = 0; j < 8; j++) {
			wv[j] = m_h[j];
		}
		for (j = 0; j < 64; j++) {
			t1 = wv[7] + SHA256_F2(wv[4]) + SHA2_CH(wv[4], wv[5], wv[6])
				+ sha256_k[j] + w[j];
			t2 = SHA256_F1(wv[0]) + SHA2_MAJ(wv[0], wv[1], wv[2]);
			wv[7] = wv[6];
			wv[6] = wv[5];
			wv[5] = wv[4];
			wv[4] = wv[3] + t1;
			wv[3] = wv[2];
			wv[2] = wv[1];
			wv[1] = wv[0];
			wv[0] = t1 + t2;
		}
		for (j = 0; j < 8; j++) {
			m_h[j] += wv[j];
		}
	}
}

void SHA256::init()
{
	m_h[0] = 0x6a09e667;
	m_h[1] = 0xbb67ae85;
	m_h[2] = 0x3c6ef372;
	m_h[3] = 0xa54ff53a;
	m_h[4] = 0x510e527f;
	m_h[5] = 0x9b05688c;
	m_h[6] = 0x1f83d9ab;
	m_h[7] = 0x5be0cd19;
	m_len = 0;
	m_tot_len = 0;
}

void SHA256::update(const unsigned char* message, unsigned int len)
{
	unsigned int block_nb;
	unsigned int new_len, rem_len, tmp_len;
	const unsigned char* shifted_message;
	tmp_len = SHA224_256_BLOCK_SIZE - m_len;
	rem_len = len < tmp_len ? len : tmp_len;
	memcpy(&m_block[m_len], message, rem_len);
	if (m_len + len < SHA224_256_BLOCK_SIZE) {
		m_len += len;
		return;
	}
	new_len = len - rem_len;
	block_nb = new_len / SHA224_256_BLOCK_SIZE;
	shifted_message = message + rem_len;
	transform(m_block, 1);
	transform(shifted_message, block_nb);
	rem_len = new_len % SHA224_256_BLOCK_SIZE;
	memcpy(m_block, &shifted_message[block_nb << 6], rem_len);
	m_len = rem_len;
	m_tot_len += (block_nb + 1) << 6;
}

void SHA256::final(unsigned char* digest)
{
	unsigned int block_nb;
	unsigned int pm_len;
	unsigned int len_b;
	int i;
	block_nb = (1 + ((SHA224_256_BLOCK_SIZE - 9)
		< (m_len % SHA224_256_BLOCK_SIZE)));
	len_b = (m_tot_len + m_len) << 3;
	pm_len = block_nb << 6;
	memset(m_block + m_len, 0, pm_len - m_len);
	m_block[m_len] = 0x80;
	SHA2_UNPACK32(len_b, m_block + pm_len - 4);
	transform(m_block, block_nb);
	for (i = 0; i < 8; i++) {
		SHA2_UNPACK32(m_h[i], &digest[i << 2]);
	}
}
std::string sha256(std::string input)
{
	unsigned char digest[SHA256::DIGEST_SIZE];
	memset(digest, 0, SHA256::DIGEST_SIZE);

	SHA256 ctx = SHA256();
	ctx.init();
	ctx.update((unsigned char*)input.c_str(), input.length());
	ctx.final(digest);

	char buf[2 * SHA256::DIGEST_SIZE + 1];
	buf[2 * SHA256::DIGEST_SIZE] = 0;
	for (int i = 0; i < SHA256::DIGEST_SIZE; i++)
		sprintf(buf + i * 2, "%02x", digest[i]);
	return std::string(buf);
}

主函数：
const char* str = "abc";
	string output = sha256(str);
	cout <<endl<< output << endl;
	//******************************************************************************





	//*********************************************************************************                //获取内存信息
	//  Sample output:
//  There is       51 percent of memory in use.
//  There are 2029968 total KB of physical memory.
//  There are  987388 free  KB of physical memory.
//  There are 3884620 total KB of paging file.
//  There are 2799776 free  KB of paging file.
//  There are 2097024 total KB of virtual memory.
//  There are 2084876 free  KB of virtual memory.
//  There are       0 free  KB of extended memory.

#include <windows.h>
#include <stdio.h>
#include <tchar.h>

// Use to convert bytes to KB
#define DIV 1024

// Specify the width of the field in which to print the numbers. 
// The asterisk in the format specifier "%*I64d" takes an integer 
// argument and uses it to pad and right justify the number.
#define WIDTH 7

void _tmain()
{
  MEMORYSTATUSEX statex;

  statex.dwLength = sizeof (statex);

  GlobalMemoryStatusEx (&statex);

  _tprintf (TEXT("There is  %*ld percent of memory in use.\n"),
            WIDTH, statex.dwMemoryLoad);
  _tprintf (TEXT("There are %*I64d total KB of physical memory.\n"),
            WIDTH, statex.ullTotalPhys/DIV);
  _tprintf (TEXT("There are %*I64d free  KB of physical memory.\n"),
            WIDTH, statex.ullAvailPhys/DIV);
  _tprintf (TEXT("There are %*I64d total KB of paging file.\n"),
            WIDTH, statex.ullTotalPageFile/DIV);
  _tprintf (TEXT("There are %*I64d free  KB of paging file.\n"),
            WIDTH, statex.ullAvailPageFile/DIV);
  _tprintf (TEXT("There are %*I64d total KB of virtual memory.\n"),
            WIDTH, statex.ullTotalVirtual/DIV);
  _tprintf (TEXT("There are %*I64d free  KB of virtual memory.\n"),
            WIDTH, statex.ullAvailVirtual/DIV);

  // Show the amount of extended memory available.

  _tprintf (TEXT("There are %*I64d free  KB of extended memory.\n"),
            WIDTH, statex.ullAvailExtendedVirtual/DIV);
}
//**********************************************************************************************