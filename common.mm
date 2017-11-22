void printToStdOut(NSString *format, ...) {
    va_list args;
    va_start(args, format);
    NSString *formattedString = [[NSString alloc] initWithFormat: format arguments: args];
    va_end(args);
    [[NSFileHandle fileHandleWithStandardOutput] writeData: [formattedString dataUsingEncoding: NSNEXTSTEPStringEncoding]];
}

void printDeviceGPS(NSString *latitude,NSString *longitude)
{
	printToStdOut(@"lat:%@ long:%@\n",latitude,longitude);
}