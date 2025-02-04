------------------------------[[ SCRIPT: Global Script ]]------------------------------
Colors = {
        Transparent = 16777215,
        AliceBlue = -984833,
        AntiqueWhite = -332841,
        Aqua = -16711681,
        Aquamarine = -8388652,
        Azure = -983041,
        Beige = -657956,
        Bisque = -6972,
        Black = -16777216,
        BlanchedAlmond = -5171,
        Blue = -16776961,
        BlueViolet = -7722014,
        Brown = -5952982,
        BurlyWood = -2180985,
        CadetBlue = -10510688,
        Chartreuse = -8388864,
        Chocolate = -2987746,
        Coral = -32944,
        CornflowerBlue = -10185235,
        Cornsilk = -1828,
        Crimson = -2354116,
        Cyan = -16711681,
        DarkBlue = -16777077,
        DarkCyan = -16741493,
        DarkGoldenrod = -4684277,
        DarkGray = -5658199,
        DarkGreen = -16751616,
        DarkKhaki = -4343957,
        DarkMagenta = -7667573,
        DarkOliveGreen = -11179217,
        DarkOrange = -29696,
        DarkOrchid = -6737204,
        DarkRed = -7667712,
        DarkSalmon = -1468806,
        DarkSeaGreen = -7357301,
        DarkSlateBlue = -12042869,
        DarkSlateGray = -13676721,
        DarkTurquoise = -16724271,
        DarkViolet = -7077677,
        DeepPink = -60269,
        DeepSkyBlue = -16728065,
        DimGray = -9868951,
        DodgerBlue = -14774017,
        Firebrick = -5103070,
        FloralWhite = -1296,
        ForestGreen = -14513374,
        Fuchsia = -65281,
        Gainsboro = -2302756,
        GhostWhite = -460545,
        Gold = -10496,
        Goldenrod = -2448096,
        Gray = -8355712,
        Green = -16744448,
        GreenYellow = -5374161,
        Honeydew = -983056,
        HotPink = -38476,
        IndianRed = -3318692,
        Indigo = -11861886,
        Ivory = -16,
        Khaki = -989556,
        Lavender = -1644806,
        LavenderBlush = -3851,
        LawnGreen = -8586240,
        LemonChiffon = -1331,
        LightBlue = -5383962,
        LightCoral = -1015680,
        LightCyan = -2031617,
        LightGoldenrodYellow = -329006,
        LightGreen = -7278960,
        LightGray = -2894893,
        LightPink = -18751,
        LightSalmon = -24454,
        LightSeaGreen = -14634326,
        LightSkyBlue = -7876870,
        LightSlateGray = -8943463,
        LightSteelBlue = -5192482,
        LightYellow = -32,
        Lime = -16711936,
        LimeGreen = -13447886,
        Linen = -331546,
        Magenta = -65281,
        Maroon = -8388608,
        MediumAquamarine = -10039894,
        MediumBlue = -16777011,
        MediumOrchid = -4565549,
        MediumPurple = -7114533,
        MediumSeaGreen = -12799119,
        MediumSlateBlue = -8689426,
        MediumSpringGreen = -16713062,
        MediumTurquoise = -12004916,
        MediumVioletRed = -3730043,
        MidnightBlue = -15132304,
        MintCream = -655366,
        MistyRose = -6943,
        Moccasin = -6987,
        NavajoWhite = -8531,
        Navy = -16777088,
        OldLace = -133658,
        Olive = -8355840,
        OliveDrab = -9728477,
        Orange = -23296,
        OrangeRed = -47872,
        Orchid = -2461482,
        PaleGoldenrod = -1120086,
        PaleGreen = -6751336,
        PaleTurquoise = -5247250,
        PaleVioletRed = -2396013,
        PapayaWhip = -4139,
        PeachPuff = -9543,
        Peru = -3308225,
        Pink = -16181,
        Plum = -2252579,
        PowderBlue = -5185306,
        Purple = -8388480,
        Red = -65536,
        RosyBrown = -4419697,
        RoyalBlue = -12490271,
        SaddleBrown = -7650029,
        Salmon = -360334,
        SandyBrown = -744352,
        SeaGreen = -13726889,
        SeaShell = -2578,
        Sienna = -6270419,
        Silver = -4144960,
        SkyBlue = -7876885,
        SlateBlue = -9807155,
        SlateGray = -9404272,
        Snow = -1286,
        SpringGreen = -16711809,
        SteelBlue = -12156236,
        Tan = -2968436,
        Teal = -16744320,
        Thistle = -2572328,
        Tomato = -40121,
        Turquoise = -12525360,
        Violet = -1146130,
        Wheat = -663885,
        White = -1,
        WhiteSmoke = -657931,
        Yellow = -256,
        YellowGreen = -6632142,
    };

PixelEdit = {};
function PixelEdit.Open(imageFile)
	return DLL.CallFunction("AutoPlay\\Docs\\PixelEdit.dll", "Open", "\""..imageFile.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function PixelEdit.GetPixel(x, y)
	return DLL.CallFunction("AutoPlay\\Docs\\PixelEdit.dll", "GetPixel", x..","..y, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end
function PixelEdit.SetPixel(x, y, color)
	DLL.CallFunction("AutoPlay\\Docs\\PixelEdit.dll", "SetPixel", x..","..y..","..color, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end
function PixelEdit.SaveAs(destinationImageFile)
	DLL.CallFunction("AutoPlay\\Docs\\PixelEdit.dll", "SaveAs", "\""..destinationImageFile.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function PixelEdit.Close()
	DLL.CallFunction("AutoPlay\\Docs\\PixelEdit.dll", "Close", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function PixelEdit.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\PixelEdit.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonClose, Event: On Click Script ]]------------------------------
PixelEdit.Close();
error = PixelEdit.GetError();

if (error == "") then
	Dialog.Message("Notice", "Done.", MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonSaveAs, Event: On Click Script ]]------------------------------
PixelEdit.SaveAs("AutoPlay\\Images\\lamborgini.02.png");
error = PixelEdit.GetError();

if (error == "") then
	Dialog.Message("Notice", "Image Saved.", MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonSetPixel, Event: On Click Script ]]------------------------------
PixelEdit.SetPixel(50, 50, Colors.Blue); --You can set pixel color in a loop
error = PixelEdit.GetError();

if (error == "") then
	Dialog.Message("Notice", "Pixel Color Set.", MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetPixel, Event: On Click Script ]]------------------------------
color = PixelEdit.GetPixel(50, 50);
error = PixelEdit.GetError();

if (error == "") then
	Dialog.Message("Notice", "Pixel Color:\t"..color, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonOpen, Event: On Click Script ]]------------------------------
hBitmap = PixelEdit.Open("AutoPlay\\Images\\lamborgini.01.bmp");
error = PixelEdit.GetError();

if (error == "") then
	Dialog.Message("Notice", "Bitmap Handle:\t"..hBitmap, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

