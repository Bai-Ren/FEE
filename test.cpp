#include <SDL2/SDL.h>
#include <iostream>

using namespace std;

SDL_Window *window = NULL;
SDL_Surface *screenSurface = NULL;

int init (int width, int height) {
	if (SDL_Init(SDL_INIT_VIDEO) < 0) {
		cout << "SDL could not initialize! SDL_ERROR: " << SDL_GetError() << endl;
		return 1;
	}

	window = SDL_CreateWindow( "SDL Window", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, width, height, SDL_WINDOW_SHOWN );

	if (SDL_Init(SDL_INIT_VIDEO) < 0) {
		cout << "SDL window could not be created! SDL_ERROR: " << SDL_GetError() << endl;
		return 1;
	}

	screenSurface = SDL_GetWindowSurface (window);

	return 0;
}

int cleanup () {
	SDL_DestroyWindow (window);
	SDL_Quit();
	return 0;
}

int main (int argc, char *argv[]) {

	if (init(640, 480))
		return 1;

	SDL_FillRect( screenSurface, NULL, SDL_MapRGB (screenSurface->format, 0xFF, 0xFF, 0xFF) );

	SDL_UpdateWindowSurface( window );

	SDL_Delay (2000);

	cleanup();

	return 0;
}