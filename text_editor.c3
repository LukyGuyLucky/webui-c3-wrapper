// Text Editor in C using WebUI
import std::io;

extern fn int webui_new_window() @cname("webui_new_window");
extern fn bool webui_show(isz,ZString) @cname("webui_show");
extern fn void webui_wait() @cname("webui_wait");
extern fn void webui_exit() @cname("webui_exit");
extern fn bool webui_set_root_folder(isz,ZString) @cname("webui_set_root_folder");
extern fn isz webui_bind(isz,ZString,Webui_callback) @cname("webui_bind");
extern fn bool webui_show_browser(isz,ZString,isz) @cname("webui_show_browser");
extern fn void webui_clean() @cname("webui_clean");

alias Webui_callback=fn void(Webui_event_t*);
struct Webui_event_t @cname("webui_event_t") {
    isz window;          // The window object number
    isz event_type;      // Event type
    ZString element;          // HTML element ID
    isz event_number;    // Internal WebUI
    isz bind_id;         // Bind ID
    isz client_id;       // Client's unique ID
    isz connection_id;   // Client's connection ID
    ZString cookies;          // Client's full cookies
}
enum Webui_browser:const inline CInt {
    NOBROWSER = 0,  // 0. NO WEB BROWSER
    ANYBROWSER = 1, // 1. DEFAULT RECOMMENDED WEB BROWSER
    CHROME,         // 2. GOOGLE CHROME
    FIREFOX,        // 3. MOZILLA FIREFOX
    EDGE,           // 4. MICROSOFT EDGE
    SAFARI,         // 5. APPLE SAFARI
    CHROMIUM,       // 6. THE CHROMIUM PROJECT
    OPERA,          // 7. OPERA BROWSER
    BRAVE,          // 8. THE BRAVE BROWSER
    VIVALDI,        // 9. THE VIVALDI BROWSER
    EPIC,           // 10. THE EPIC BROWSER
    YANDEX,         // 11. THE YANDEX BROWSER
    CHROMIUMBASED,  // 12. ANY CHROMIUM BASED BROWSER
    WEBVIEW,        // 13. WebView (Non-web-browser)
}

enum Webui_event :const inline CInt{
    WEBUI_EVENT_DISCONNECTED = 0, // 0. Window disconnection event
    WEBUI_EVENT_CONNECTED,        // 1. Window connection event
    WEBUI_EVENT_MOUSE_CLICK,      // 2. Mouse click event
    WEBUI_EVENT_NAVIGATION,       // 3. Window navigation event
    WEBUI_EVENT_CALLBACK,         // 4. Function call event
}
fn void close_app(Webui_event_t* e) {
	io::printf("Exit.\n");

	// Close all opened windows
	webui_exit();
}

fn int main() {

	// Create a new window
	int mainWindow = webui_new_window();

	// Set the root folder for the UI
	webui_set_root_folder(mainWindow, "ui");

	// Bind HTML elements with the specified ID to C functions
	webui_bind(mainWindow, "close_app", &close_app);

	// Show the window, preferably in a chromium based browser
	if (!webui_show_browser(mainWindow, "index.html", Webui_browser.ANYBROWSER))
	{
		webui_show(mainWindow, "index.html");
	}
	// Wait until all windows get closed
	webui_wait();

	// Free all memory resources (Optional)
	webui_clean();

	return 0;
}
/*
#if defined(_MSC_VER)
int APIENTRY WinMain(HINSTANCE hInst, HINSTANCE hInstPrev, PSTR cmdline, int cmdshow) { return main(); }
#endif
*/