// WebUI C - Minimal Example

extern fn isz webui_new_window() @cname("webui_new_window");
extern fn bool webui_show(isz,ZString) @cname("webui_show");
extern fn void webui_wait() @cname("webui_wait");


fn int main() {

	isz my_window = webui_new_window();
	webui_show(my_window, "<html><head><script src=\"webui.js\"></script></head> Hello World ! </html>");
	webui_wait();
	return 0;
}

/*
#if defined(_MSC_VER)
int APIENTRY WinMain(HINSTANCE hInst, HINSTANCE hInstPrev, PSTR cmdline, int cmdshow) { return main(); }
#endif
*/