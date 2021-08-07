#include"head and macro.h"
#include"Class.h"
#include"function declaration.h"
#include"struct.h"

int main()
{
	 //全局变量声明：
     //开始--------

	extern MyStruct s;

    //结束--------
	//****************从这里开始写主函数代码**********************
	//*************************************************************************



	//*************************************************************************
	runstart();
	//*************************计时开始***************************************
	
	char* a1 = NULL;
	char* a2 = NULL;
	a1 = (char*)malloc(10 * sizeof(char));
	strcpy(a1, "12345678");
	a2 = (char*)malloc(10 * sizeof(char));
	strcpy(a2, "123456789");
	int lena1 = strlen(a1);
	int lena2 = strlen(a2);
	if (lena1 < lena1 + lena2)
	{
		a1 = (char*)realloc(a1, (lena1 + lena2 + 1) * sizeof(char));
	}
	for (int i = lena1;i < lena1 + lena2;i++)
	{
		a1[i] = a2[i - lena1];
	}
	a1[lena1 + lena2] = '\0';
	cout << a1 << endl;
	free(a1);
	free(a2);

	//*************************计时结束***************************************
	runend();



	//***************************结束********************************
	rundisplay();                                                                   //计时结果显示
	_getch();
	//closegraph();
	// system("pause");
	//Sleep(10000);
	return 0;
}
