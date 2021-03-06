#define unicode
#include "windows.bi"

Const SectionWindow = "Окно"
Const KeyWidth = "Width"
Const KeyHeight = "Height"
Const DefaultValue = NULL
Const BufferSize As Integer = 32000 - 1

' Печать результата
Sub PrintResult(ByRef ValueList As WString)
	Dim pItem As WString Ptr = @ValueList
	Dim ItemLength As Integer = Len(*pItem)
	
	' До тех пор, пока элемент больше нуля
	Do While ItemLength > 0
		Print *pItem
		pItem = @pItem[ItemLength + 1]
		ItemLength = Len(*pItem)
	Loop
End Sub


' Полный путь к файлу
Dim FileName As WString * (MAX_PATH + 1) = Any
FileName = ExePath() & "\configuration.ini"

' Все секции INI‐файла
Dim AllSections As WString * (BufferSize + 1) = Any ' + 1 под завершающий нулевой символ

GetPrivateProfileString(Null, Null, DefaultValue, @AllSections, BufferSize, FileName)
PrintResult(AllSections)

' Получение всех ключей в секции Окно
Dim AllKeys As WString * (BufferSize + 1) = Any ' + 1 под завершающий нулевой символ

GetPrivateProfileString(SectionWindow, Null, DefaultValue, @AllKeys, BufferSize, FileName)
PrintResult(AllKeys)
