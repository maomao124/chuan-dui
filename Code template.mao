
����ģ�壺
by mao
����QQ1296193245

main.cpp
/*   *************************************                                             //ȫ��ͼ�δ���ģ��
	int rw, rh;
	rw = GetSystemMetrics(SM_CXSCREEN);                                          // ��Ļ���� ����
	rh = GetSystemMetrics(SM_CYSCREEN);                                          // ��Ļ�߶� ����
	HWND hwnd = initgraph(rw, rh);                                                    // ��ʼ����ͼ���ڲ���ȡ���ھ��
	setbkcolor(GREEN);
	cleardevice();
	LONG l_WinStyle = GetWindowLong(hwnd, GWL_STYLE);               // ��ȡ������Ϣ
																										 // ���ô�����Ϣ ��� ȡ�����������߿�
	SetWindowLong(hwnd, GWL_STYLE, (l_WinStyle | WS_POPUP | WS_MAXIMIZE) & ~WS_CAPTION & ~WS_THICKFRAME & ~WS_BORDER);           // �޸Ĵ�����ʽ
	SetWindowPos(hwnd, HWND_TOP, 0, 0, rw, rh, 0);
	*/   //***********************************


	/*      ***********************************
	initgraph(1600, 900);
	setbkcolor(WHITE);
	cleardevice();
	*/  //***********************************


	/*    ***********************************                                             //��̨��ʽ���У�Unicode�ַ����ĳɶ��ֽ��ַ���
	HWND hwnd; if (hwnd = ::FindWindow("ConsoleWindowClass", NULL)) //�ҵ�����̨���
	{
		::ShowWindow(hwnd, SW_HIDE); //���ؿ���̨����
	}
                                                                                                    //unicode�ַ����£�
	const char* sss = "ConsoleWindowClass";
	WCHAR wszName[200];
	memset(wszName, 0, sizeof(wszName));
	MultiByteToWideChar(CP_ACP, 0, sss, strlen(sss) + 1, wszName,
		sizeof(wszName) / sizeof(wszName[0]));
	HWND hwnd; if (hwnd = ::FindWindow(wszName, NULL)) //�ҵ�����̨���
	{
		::ShowWindow(hwnd, SW_HIDE); //���ؿ���̨����
	}
	*/  //**********************************


	/*   *************************************
	constexpr int MIN = 1;                            //�����
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
	SYSTEMTIME sys;                                    //��ȡϵͳʱ��
	GetLocalTime(&sys);
	cout << sys.wYear << "/" << sys.wMonth << "/" << sys.wDay << "      ";
	cout<< setfill('0') << setw(2) << sys.wHour << ":" << setfill('0') << setw(2) << sys.wMinute << ":" << setfill('0') << setw(2) << sys.wSecond << endl;
	*/   //***********************************


	/*   ************************************                            //΢��TTS����ģ��
	ISpVoice* pVoice = NULL;                                            //����һ��ISpVoice�Ŀ�ָ��
	if (FAILED(::CoInitialize(NULL)))                                     //��ʼ��COM��̻���
	{
		cout << "��ʼ��COM����ʧ�ܣ�" << endl;
		return 0;
	}
	                                                                                   //��ȡISpVoice�ӿڶ���
	HRESULT hr = CoCreateInstance(CLSID_SpVoice, NULL, CLSCTX_ALL, IID_ISpVoice, (void**)&pVoice);
	if (SUCCEEDED(hr))                                                      //�����ȡ�ӿڶ���ɹ�
	{
		char* szStr = (char*)malloc(200);
		sprintf(szStr, "��ã����硣");
		WCHAR wszClassName[200];
		memset(wszClassName, 0, sizeof(wszClassName));
		MultiByteToWideChar(CP_ACP, 0, szStr, strlen(szStr) + 1, wszClassName,
			sizeof(wszClassName) / sizeof(wszClassName[0]));
		hr = pVoice->Speak(wszClassName, 0, NULL);         //�ʶ�
		
		pVoice->Release();                                                 //�ͷŷ�����Դ
		pVoice = NULL;                                                     //��ֹҰָ��
	}
	::CoUninitialize();                                                       //�˳�COM��̻���
	*/  //*********************************


	/*   **********************************                          //���߳�ģ��
	void task()
    {
	//���̴߳���
    }
	thread t(task);
	t.detach();
	*/   //*******************************


	/*   ************************************                                  //�Զ������̨���λ��
	HANDLE hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
	COORD coordScreen = { 0, 0 };                                           //���λ��
	CONSOLE_SCREEN_BUFFER_INFO csbi;
	if (GetConsoleScreenBufferInfo(hConsole, &csbi))
	{
		printf("�������:(%d,%d)\n", csbi.dwCursorPosition.X, csbi.dwCursorPosition.Y);
	}
	HANDLE   hStdout;
	COORD     cursorPos;                                                       //��׼������
	hStdout = GetStdHandle(STD_OUTPUT_HANDLE);
	cursorPos.X = 0;
	cursorPos.Y = csbi.dwCursorPosition.Y + 1;
	SetConsoleCursorPosition(hStdout, cursorPos);
	cout << "��1��" << endl;
	*/  //*********************************



	//***************************************                               //��������
	char password[50];      //�����������Ŵ�
	//string password;
	char pw[50], ch;
	printf("����������:");
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
	//password = pw;   //�������������������Ŵ�
	strcpy(password, pw);
	cout <<endl<< password << endl;
	//***************************************



	//***************************************



	//***************************************                        //API��ȡ���״̬
	initgraph(1640, 980);		// ��ʼ����ͼ����
	HWND hwnd = GetHWnd();		// ��ȡ��ͼ���ھ��
	POINT point;
	TCHAR s[10];
	while (true)
	{
		GetCursorPos(&point);			// ��ȡ���ָ��λ�ã���Ļ���꣩
		ScreenToClient(hwnd, &point);	// �����ָ��λ��ת��Ϊ��������
		// ��ȡ��갴��״̬������ GetAsyncKeyState ���������ﲻ��������
		// ����������
		sprintf(s, _T("x�᣺%d    "), point.x);
		outtextxy(0, 0, s);
		sprintf(s, _T("y�᣺%d    "), point.y);
		outtextxy(0, 20, s);
		// �ʵ���ʱ
		Sleep(10);
	}
	//***********************************************************************



	//**************************************************************************                       //��������
	// ������
	mciSendString(_T("open music.mp3 alias mymusic"), NULL, 0, NULL);
	outtextxy(0, 0, _T("���������ʼ����"));
	_getch();
	// ��������
	mciSendString(_T("play mymusic"), NULL, 0, NULL);
	outtextxy(0, 0, _T("�������ֹͣ����"));
	_getch();
	// ֹͣ���Ų��ر�����
	mciSendString(_T("stop mymusic"), NULL, 0, NULL);
	mciSendString(_T("close mymusic"), NULL, 0, NULL);
	//****************************************************************************



	//*********************************************************************************        �˳�������ʾ
	int c;
	while (!_kbhit())
	{
		c=_getch();
		cout << c;
		// ���˳�ʱ����ʾ�Ի�����ѯ�û��Ƿ��˳�
		if (c == 27)
		{
			HWND wnd = GetHWnd();
			cout << "\a";
			if (MessageBox(wnd, _T("��Ҫ�˳���"), _T("����"), MB_OKCANCEL | MB_ICONQUESTION) == IDOK)
				break;
		}
	}
	//********************************************************************************



	//********************************************************************************                          //������󻯿���̨����
	HWND hwnd = GetForegroundWindow();
	int cx = GetSystemMetrics(SM_CXSCREEN);            /* ��Ļ���� ���� */
	int cy = GetSystemMetrics(SM_CYSCREEN);            /* ��Ļ�߶� ���� */
	LONG l_WinStyle = GetWindowLong(hwnd, GWL_STYLE);   /* ��ȡ������Ϣ */
	/* ���ô�����Ϣ ��� ȡ�����������߿� */
	SetWindowLong(hwnd, GWL_STYLE, (l_WinStyle | WS_POPUP | WS_MAXIMIZE) & ~WS_CAPTION & ~WS_THICKFRAME & ~WS_BORDER);
	SetWindowPos(hwnd, HWND_TOP, 0, 0, cx+17, cy, 0);
	//********************************************************************************














�⺯���Լ�API������
	//C �⺯�� int islower(int c) ����������ַ��Ƿ���Сд��ĸ��
	//��� c ��һ��Сд��ĸ����ú������ط���ֵ��true�������򷵻� 0��false��
	//C �⺯�� int isupper(int c) ����������ַ��Ƿ��Ǵ�д��ĸ��
	//��� c ��һ����д��ĸ����ú������ط���ֵ��true�������򷵻� 0��false��
	//C �⺯�� int tolower(int c) �Ѹ�������ĸת��ΪСд��ĸ��
	//��� c �����Ӧ��Сд��ĸ����ú������� c ��Сд��ĸ������ c ���ֲ��䡣����ֵ��һ���ɱ���ʽת��Ϊ char ���͵� int ֵ��
	//C �⺯�� int toupper(int c) ��Сд��ĸת��Ϊ��д��ĸ��
	//��� c �����Ӧ�Ĵ�д��ĸ����ú������� c �Ĵ�д��ĸ������ c ���ֲ��䡣����ֵ��һ���ɱ���ʽת��Ϊ char ���͵� int ֵ��

1	//C �⺯�� double acos(double x) �����Ի��ȱ�ʾ�� x �ķ����ҡ�
	//x -- ���� [-1,+1] ����ĸ���ֵ��
	//�ú��������Ի��ȱ�ʾ�� x �ķ����ң���������Ϊ [0, pi]��
	double x, ret, val;
#define PI 3.14159265
	cout << "������x��ֵ������[-1,+1]" << endl;
	cin >> x;
	val = 180.0 / PI;
	ret = acos(x) * val;
	printf("%lf �ķ������� %lf �ȣ����ȣ�%lf", x, ret, acos(x));
2	//C �⺯�� double asin(double x) �����Ի��ȱ�ʾ�� x �ķ����ҡ�
	//x -- ���� [-1,+1] ����ĸ���ֵ
	//�ú��������Ի��ȱ�ʾ�� x �ķ����ң���������Ϊ [-pi/2,+pi/2]
3   //C �⺯�� double atan(double x) �����Ի��ȱ�ʾ�� x �ķ����С�
	//x -- ����ֵ��
	//�ú��������Ի��ȱ�ʾ�� x �ķ����У���������Ϊ [-pi/2,+pi/2]��
4	//C �⺯�� double atan2(double y, double x) �����Ի��ȱ�ʾ�� y/x �ķ����С�y �� x ��ֵ�ķ��ž�������ȷ�����ޡ�
	//x -- ���� x ������ĸ���ֵ��
	//y -- ���� y ������ĸ���ֵ��
	//�ú��������Ի��ȱ�ʾ�� y/x �ķ����У���������Ϊ [-pi,+pi]��
5	//C �⺯�� double cos(double x) ���ػ��Ƚ� x �����ҡ�
	//x -- ����ֵ��������һ���Ի��ȱ�ʾ�ĽǶȡ�
	//�ú������� x �����ҡ�
6	//cosh(x)=��e^x+e^(-x��)/2                                                                   //˫������
	cout << "��ʽ��cosh(x)=��e^x+e^(-x��)/2" << endl;
	double x;
	cout << "������x��ֵ��" << endl;
	cin >> x;
	printf("%lf ��˫�������� %lf\n", x, cosh(x));
	//C �⺯�� double sin(double x) ���ػ��Ƚ� x �����ҡ�
7	//x -- ����ֵ��������һ���Ի��ȱ�ʾ�ĽǶ�
	//�ú������� x ������
8	//sinh(x)=��e^x-e^(-x)��/2                                                                    // ˫������
	cout << "��ʽ��sinh(x)=��e^x-e^(-x)��/2" << endl;
	double x, ret;
	cout << "������x��ֵ��" << endl;
	cin >> x;
	ret = sinh(x);
	printf("%lf ��˫�������� %lf ", x, ret);
9	//tanh��x��=��e^x-e^(-x��)/��e^x+e^(-x��)=sinh(x)/cosh(x��                //  ˫������
	cout << "��ʽ��tanh��x��=��e^x-e^(-x��)/��e^x+e^(-x��)=sinh(x)/cosh(x��" << endl;
	double x, ret;
	cout << "������x��ֵ��" << endl;
	cin >> x;
	ret = tanh(x);
	printf("%lf ��˫�������� %lf ", x, ret);
10	//C �⺯�� double exp(double x) ���� e �� x ���ݵ�ֵ
	cout << "e �� x ����" << endl;
	cout << "������x��ֵ��" << endl;
	double x;
	cin >> x;
	printf("e �� %lf ������ %lf\n", x, exp(x));
11	//C �⺯�� double frexp(double x, int *exponent) �Ѹ����� x �ֽ��β����ָ��������ֵ��β��������ָ������ exponent �С����õ�ֵ�� x = mantissa * 2 ^ exponent��
	//x -- Ҫ������ĸ���ֵ��
	//exponent -- ָ��һ�������ָ�룬�ö���洢��ָ����ֵ��
	//�ú������ع��С����������� x ��Ϊ�㣬����С���� x �Ķ��η��������ľ���ֵ��Χ�� 1/2���������� 1��������������� x Ϊ�㣬����С�����㣬����洢�� exp �С�
	double x, fraction;
	int e;
	cout << "������Ҫ�ֽ�ĸ�������" << endl;
	cin >> x;
	fraction = frexp(x, &e);
	cout << "β����" << fraction << endl;
	cout << "  �ף�" << e << endl;
	printf("x = %.2lf = %.2lf * 2^%d\n", x, fraction, e);
12	//C �⺯�� double ldexp(double x, int exponent) ���� x ���� 2 �� exponent ���ݡ�
	//x -- ������Чλ���ĸ���ֵ��
	//exponent -- ָ����ֵ��
	cout << "x ���� 2 �� exponent ����" << endl;
	double x, ret;
	int n;
	cout << "��ֱ�����x��ֵ��exponent��ֵ��" << endl;
	cin >> x >> n;
	ret = ldexp(x, n);
	cout <<"�����" << x;
	printf(" * 2^%d = %f\n", n, ret);
13	//C �⺯�� double log(double x) ���� x ����Ȼ����������Ϊ e �Ķ�����
	double x, ret;
	cout << "x ����Ȼ����" << endl;
	cout << "������x��ֵ��" << endl;
	cin >> x;
	ret = log(x);
	printf("log(%lf) = %lf", x, ret);
14	//C �⺯�� double log10(double x) ���� x �ĳ��ö���������Ϊ 10 �Ķ�����
	//�ú������� x �ĳ��ö�����x ��ֵ���� 0
15	//C �⺯�� double modf(double x, double *integer) ����ֵΪС�����֣�С�����Ĳ��֣��������� integer Ϊ��������
	//x -- ����ֵ��
	//integer -- ָ��һ�������ָ�룬�ö���洢���������֡�
	double x, fractpart, intpart;
	cout << "������һ��������" << endl;
	cin >> x;
	fractpart = modf(x, &intpart);
	printf("�������� = %lf\n", intpart);
	printf("С������ = %lf \n", fractpart);
16	//C �⺯�� double pow(double x, double y) ���� x �� y ����
17   //C �⺯�� double sqrt(double x) ���� x ��ƽ������
18    //C �⺯�� double fmod(double x, double y) ���� x ���� y ������
	cout << "���� x ���� y ������(֧�ָ�����)" << endl;
	double x, y;
	cout << "������x��ֵ��";
	cin >> x;
	cout << "������y��ֵ��";
	cin >> y;
	cout << "���Ϊ��" << fmod(x, y) << endl;

1	//C �⺯�� double atof(const char *str) �Ѳ��� str ��ָ����ַ���ת��Ϊһ��������������Ϊ double �ͣ�
	//��������ת�����˫���ȸ����������û��ִ����Ч��ת�����򷵻��㣨0.0��
	double val;
	char str[20];
	strcpy(str, "123456789");
	val = atof(str);
	printf("�ַ���ֵ = %s, ����ֵ = %f\n", str, val);
	strcpy(str, "213run125");
	val = atof(str);
	printf("�ַ���ֵ = %s, ����ֵ = %f\n", str, val);
2	//C �⺯�� int atoi(const char *str) �Ѳ��� str ��ָ����ַ���ת��Ϊһ������������Ϊ int �ͣ�
	//�ú�������ת����ĳ����������û��ִ����Ч��ת�����򷵻���
3	//C �⺯�� long int atol(const char *str) �Ѳ��� str ��ָ����ַ���ת��Ϊһ��������������Ϊ long int �ͣ�
4	//C �⺯�� unsigned long int strtoul(const char *str, char **endptr, int base) �Ѳ��� str ��ָ����ַ������ݸ����� base ת��Ϊһ���޷��ų�����
	//������Ϊ unsigned long int �ͣ���base ������� 2 �� 36��������֮�䣬����������ֵ 0
	  //str -- Ҫת��Ϊ�޷��ų��������ַ�����
		//endptr -- ������Ϊ char* �Ķ�������ã���ֵ�ɺ�������Ϊ str ����ֵ�����һ���ַ���
		//base -- ������������� 2 �� 36��������֮�䣬����������ֵ 0��
	char str[30] = "2030300 This is test";
	char* ptr;
	long ret;
	ret = strtoul(str, &ptr, 10);
	printf("���֣��޷��ų��������� %lu\n", ret);
	printf("�ַ��������� %s", ptr);
5	//C �⺯�� size_t wcstombs(char *str, const wchar_t *pwcs, size_t n) �ѿ��ַ��ַ��� pwcs ת��Ϊһ�� str ��ʼ�Ķ��ֽ��ַ����������� n ���ֽڱ�д�� str ��
	//str -- ָ��һ�� char Ԫ�ص����飬������ n �ֽڳ���
	//pwcs -- Ҫ��ת���Ŀ��ַ��ַ�����
    //n -- Ҫ��д�뵽 str �е�����ֽ�����
	size_t ret;
	char* MB = (char*)malloc(50);
	const wchar_t* WC = L"12389756";
	/* ת�����ַ��ַ��� */
	ret = wcstombs(MB, WC, 50);
	printf("Ҫת�����ַ��� = %u\n", ret);
	printf("���ֽ��ַ� = %s\n\n", MB);

	��ɫ���䣺
	setfillcolor(HSLtoRGB(a, 1, 0.5));                 //a�����䣺[0,359]
	 ��ȡͼ��
	IMAGE img;
	loadimage(&img, _T("test.png"));
	��ʾͼ��
	putimage(0, 0, &img);
	����ͼ��
	saveimage(_T("textout.jpg"), &img);

	�ַ�����
	char ch[20] = "sdasdacsdasdas";
    cout << ch << endl;
    sort(ch, ch + 14);
    cout << ch << endl;
	�����ֵ��
	fabs(x);
	abs(x);
	Ԫ�ط�ת��
	 int a[10] = { 10,11,12,13,14,15 };
    reverse(a, a + 4);
	����ֵͬ��
	 int a[10] = { 1,2,3,4,5 };
    fill(a, a + 5, 233);

	������
	Beep(1200, 300);                                                //��һ���������������ڶ��������Ƿ���ʱ�䣬��λ�Ǻ���
	���߳�ģʽ��
	void voicebeep()
   {
	Beep(800, 3000);
   }
   thread t(voicebeep);                             //��������
	t.detach();





















	function.cpp
	/*   ****************************************
void FpsTime(const time_t* t0, time_t* t1, const time_t* t2)// ͼ�ν��������ʾFPS������ʱ��
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
	fpsTime += L" ����ʱ��: ";
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
bool ChangeDisSize(int cx, int cy)	                                  // �ֱ�������Ϊ cx �� cy���˳�����ʱ�Զ���ԭ
{
	LPDIRECTDRAW DXW;
	HRESULT ddrval;
	ddrval = DirectDrawCreate(NULL, &DXW, NULL);
	if (DD_OK != DD_OK) return FALSE;	                         // ����DirectDraw����ʧ�ܷ���
	ddrval = DXW->SetCooperativeLevel(NULL, DDSCL_NORMAL);
	if (DD_OK != DD_OK) return FALSE;	                         // ȡ�ô���ģʽʧ�ܷ���
	ddrval = DXW->SetDisplayMode(cx, cy, 16);
	if (DD_OK != DD_OK) return FALSE;	                          // ������ʾģʽʧ�ܷ���
}
*/

//**********************************************************************//������ܽ����㷨
//�����ַ��������
char MakecodeChar(char c, int key)
{
	return c = c ^ key;
}
//�����ַ�����
char CutcodeChar(char c, int key)
{
	return c ^ key;
}
//����
void Makecode(char* pstr, int* pkey)
{
	int len = strlen(pstr);//��ȡ����
	for (int i = 0;i < len;i++)
		*(pstr + i) = MakecodeChar(*(pstr + i), pkey[i % 5]);
}
//����
void Cutecode(char* pstr, int* pkey)
{
	int len = strlen(pstr);
	for (int i = 0;i < len;i++)
		*(pstr + i) = CutcodeChar(*(pstr + i), pkey[i % 5]);
}


char* jiami(char s[])
{
	int key[] = { 1,2,3,4,5 };//�����ַ�

	char* p = s;
	Makecode(s, key);//����
	return p;
}

char* jiemi1(char s[])
{
	int key[] = { 9,5,4,6,1 };//�����ַ�
	char* p = s;
	Cutecode(s, key);//����
	return p;
}

char* jiemi2(char s[])
{
	int key[] = { 2,8,7,1,3 };//�����ַ�
	char* p = s;
	Cutecode(s, key);//����
	return p;
}

char* jiemi22(char s[])
{
	int key[] = { 3,8,7,9,3 };//�����ַ�
	char* p = s;
	Cutecode(s, key);//����
	return p;
}
//************************************************************************

























ģ�飺
//*************************************************************************                  //ɢ���㷨 MD5  �ļ����顢������ܵ�


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

��������
const char* s = "abc";
	 string s1= MD5(s).toString();
	 cout << s1 << endl;
	 string s2 = FileDigest("test.txt");
	cout << s2<< endl;
	if (s1 == s2)
	{
		cout << "��ͬ" << endl;
	}
	else
	{
		cout << "��ͬ" << endl;
	}
	//*****************************************************************


	//********************************************************************//ɢ���㷨 sha256 ������ܵ�
	
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

��������
const char* str = "abc";
	string output = sha256(str);
	cout <<endl<< output << endl;
	//******************************************************************************





	//*********************************************************************************                //��ȡ�ڴ���Ϣ
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