#include <p32xxxx.h>

void delay() {
	unsigned int i= 1000000;
	while (i-- > 0);
}
int main() {
	TRISGCLR= 0x00000040;
	LATGCLR= 0x00000040;
	while (1) {
		delay();
		LATGINV= 0x00000040;
	}
}
