-- ON GLOBAL:

-----------------------------------------------------------------------------------------------
-- ���������� ����������
-----------------------------------------------------------------------------------------------
sDllName		= _SourceFolder.."\\AutoPlay\\Docs\\waterctrl.dll";	-- ��� ������������ Dll	
bLoaded			= false;											-- ���� (true - �������� ���������, false - �������� ���������)
WaterMark		= {};												-- ������ WaterMark
hWndWaterMark	= 0;												-- ���������� ���� �������� � �������� ����

-----------------------------------------------------------------------------------------------
-- ������� API ������ � waterctrl.dll
-- !!! �� ������� !!!
-----------------------------------------------------------------------------------------------
function LoadLibrary(lpFileName) local hDll = tonumber(DLL.CallFunction("kernel32.dll", "LoadLibraryA", "\""..lpFileName.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)); return hDll end	
function FreeLibrary(hLibModule) local Result = tonumber(DLL.CallFunction("kernel32.dll", "FreeLibrary", hLibModule, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)); return Result end	
function LoadImage(hInst, lpszName, uType, cxDesired, cyDesired, fuLoad) local hBmp = tonumber(DLL.CallFunction("user32.dll", "LoadImageA", hInst..",\""..lpszName.."\","..uType..","..cxDesired..","..cyDesired..","..fuLoad, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)); return hBmp end	
function FindWindowEx(hWnd1, hWnd2, lpsz1, lpsz2) local hWnd = tonumber(DLL.CallFunction("user32.dll", "FindWindowExA", hWnd1..","..hWnd2..","..lpsz1..","..lpsz2, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)); return hWnd end
function CreateWindowEx(dwExStyle, lpClassName, lpWindowName, dwStyle, x, y, nWidth, nHeight, hWndParent, hMenu, hInstance, lpParam) local hWnd = tonumber(DLL.CallFunction("user32.dll", "CreateWindowExA", dwExStyle..",\""..lpClassName.."\",\""..lpWindowName.."\","..dwStyle..","..x..","..y..","..nWidth..","..nHeight..","..hWndParent..","..hMenu..","..hInstance..","..lpParam, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)); return hWnd end
function DeleteObject(hObject) local Result = tonumber(DLL.CallFunction("gdi32.dll", "DeleteObject", hObject, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)); return Result end	
function ChildWindowFromPoint(hWnd, x, y) local Result = tonumber(DLL.CallFunction("user32.dll", "ChildWindowFromPoint", hWnd..","..x..","..y, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)); return Result end	
function SetParent(hWndChild, hWndNewParent) local Result = tonumber(DLL.CallFunction("user32.dll", "SetParent", hWndChild..","..hWndNewParent, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)); return Result end	
function EnableWindow(hWnd, fEnable) local Result = tonumber(DLL.CallFunction("user32.dll", "EnableWindow", hWnd..","..fEnable, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)); return Result end	

function enablewater(hWnd, Left, Top, hBitmap, WaterRadius, WaterHeight) local Result = tonumber(DLL.CallFunction(sDllName, "enablewater", hWnd..","..Left..","..Top..","..hBitmap..","..WaterRadius..","..WaterHeight, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)); return Result end
function disablewater() local Result = tonumber(DLL.CallFunction(sDllName, "disablewater", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)); return Result end
function waterblob(X, Y, WaterRadius, WaterHeight) local Result = tonumber(DLL.CallFunction(sDllName, "waterblob", X..","..Y..","..WaterRadius..","..WaterHeight, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)); return Result end
function flattenwater() local Result = tonumber(DLL.CallFunction(sDllName, "flattenwater", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)); return Result end
function setwaterparent(hWnd) local Result = tonumber(DLL.CallFunction(sDllName, "setwaterparent", hWnd, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)); return Result end

-----------------------------------------------------------------------------------------------
-- ������� �������� � �������� ����
-----------------------------------------------------------------------------------------------
function WaterMark.Create(sImageName, Left, Top, Width, Height, WaterRadius, WaterHeight)
	-- ������� �������� � �������� ����, ���� ��� ��� ���� �������
	disablewater();																							-- ������� �������� � �������� ����
	if hBmp then DeleteObject(hBmp); end																	-- ������� ������ ��������
	if hDll then FreeLibrary(hDll);	end																		-- ��������� Dll �� ������
	-- ������� �������� � �������� ����
	hDll = LoadLibrary(sDllName);																			-- ���������� Dll
	local tImageSize = Image.GetFileInfo(sImageName);														-- ������� �������� �� ����� bmp
	if Width == 0 then Width = tImageSize.Width end															-- ���� �� ������� ������ ��������, �� ������������� ������������ ������ ��������
	if Height == 0 then Height = tImageSize.Height end														-- ���� �� ������� ������ ��������, �� ������������� ������������ ������ ��������
	hBmp = LoadImage(0, sImageName, 0, Width, Height, 16);													-- ���������� �������� bmp
	local hWnd = DialogEx.GetWndHandle();																	-- ���������� ����������� ����
	if hWnd == -1 then																						-- ���� ������� �������� ���� �������		
		hWnd = Application.GetWndHandle();																	-- ���������� ���� �������
		hWnd = FindWindowEx(hWnd, 0, 0, 0);																	-- ���������� ���������� ���� �������
	end
	Result = enablewater(hWnd, Left, Top, hBmp, WaterRadius, WaterHeight);									-- ������ ����
	if Result == 1 then																						-- ���� ������� �������� � �������� ����
		hWndWaterMark = ChildWindowFromPoint(hWnd, Left, Top);												-- �������� ���������� ���� � ���������
		bLoaded = true;																						-- ������������� ����: ������� ���������
	else																									-- ���� �� ������� �������� � �������� ����
		hWndWaterMark = 0;																					-- ��������	���������� ���� � ���������
		bLoaded = false;																					-- ������������� ����: ������� �� ���������
	end		
	return hWndWaterMark																					-- ���������� ���������� ���� � ���������
end

-----------------------------------------------------------------------------------------------
-- ������� �������� � �������� ����
-----------------------------------------------------------------------------------------------
function WaterMark.Destroy()
	disablewater();																	-- ������� �������� � �������� ����
	if hBmp then DeleteObject(hBmp); end											-- ������� ������ ��������
	if hDll then FreeLibrary(hDll);	end												-- ��������� Dll �� ������
	bLoaded = false;																-- ���������� ���� �������� ��������
end

-----------------------------------------------------------------------------------------------
-- ������� ���� � ��������� �����
-----------------------------------------------------------------------------------------------
function WaterMark.Blob(X, Y, WaterRadius, WaterHeight)
	if bLoaded then									-- ���� �������� ���������
		waterblob(X, Y, WaterRadius, WaterHeight);	-- ������ ������� ����
	end
end

-----------------------------------------------------------------------------------------------
-- ��������� �������� ����
-----------------------------------------------------------------------------------------------
function WaterMark.Flatten()
	if bLoaded then		-- ���� �������� ���������
		flattenwater();	-- ��������� �������� ����
	end
end

-----------------------------------------------------------------------------------------------
-- ��������� ����� ������������ ���� ��� ���� �������� � �������� ���� � ������������� ����� ���������� 
-----------------------------------------------------------------------------------------------
function WaterMark.SetParent(hWnd, Left, Top)
	if bLoaded then									-- ���� �������� ���������
		SetParent(hWndWaterMark, hWnd);				-- ��������� ����� ������������ ���� ��� ���� ��������
		Window.SetPos(hWndWaterMark, Left, Top);	-- ����� ������� ���� �������� � �������� ����
	end
end

-----------------------------------------------------------------------------------------------
-- ���������/���������� ���� �������� � �������� ����
-----------------------------------------------------------------------------------------------
function WaterMark.Enabled(fEnable)
	if bLoaded then											-- ���� �������� ���������
		if fEnable then fEnable = 1 else fEnable = 0 end	-- ������������ ���� � �������� ���
		EnableWindow(hWndWaterMark, fEnable);				-- ����������/��������� ���� �������� � �������� ����
	end
end

-----------------------------------------------------------------------------------------------
-- �����������/������� ���� �������� � �������� ����
-----------------------------------------------------------------------------------------------
function WaterMark.Visible(fEnable)
	if bLoaded then						-- ���� �������� ���������
		if fEnable then 				
			Window.Show(hWndWaterMark);	-- ���������� ���� �������� � �������� ����
		else
			Window.Hide(hWndWaterMark);	-- �������� ���� �������� � �������� ����	
		end
	end
end

-----------------------------------------------------------------------------------------------
-- ������������� ����� ��� ���� �������� � �������� ����
-----------------------------------------------------------------------------------------------
function WaterMark.SetMask(sMaskName)
	if bLoaded then											-- ���� �������� ���������
		Window.SetMask(hWndWaterMark, sMaskName, true, 0);	-- ��������� ����� ��� ���� �������� � �������� ����
	end
end

-- On Preload

local sImageName	= "Autoplay\\Images\\WaterMark.bmp";									-- ���� + ��� �������� (!!! ������ BMP !!!)
local Left			= 0;																	-- ����� ������� ��������
local Top			= 0;																	-- ������� ������� �������
local Width			= 0;																	-- ������ �������� (���� 0, �� ��������������� ������������ ������ ��������)
local Height		= 0;																	-- ������ �������� (���� 0, �� ��������������� ������������ ������ ��������)
local WaterRadius	= 3;																	-- ������ �����
local WaterHeight	= 25;																	-- ������ �����
 
hWndWM = WaterMark.Create(sImageName, Left, Top, Width, Height, WaterRadius, WaterHeight);	-- ������� �������� � �������� ���� � ���������� ���������� ���� � ���������