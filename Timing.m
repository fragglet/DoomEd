#if 0 // Timing code is currently disabled.

/* Timing.m */

#import "Timing.h"
#import "ps_quartz.h"

#import <stdio.h>

@implementation Timing

+newWithTag:(int) aTag
{
    self = [super new];
    // TODO tag = aTag;
    [self reset];
    return self;
}

-enter:(int)wt
{
    if(wallTime = (wt==WALLTIME))
    [self wallEnter];
    else
    [self psEnter];
    return self;
}

-wallEnter
{
    cumTimesEntered++;
    NXPing();
    gettimeofday(&realtime,&tzone);
    synctime = realtime.tv_sec + realtime.tv_usec/1000000.0;
    return self;
}

-tare
{
    struct timezone tzone1;
    struct timeval realtime1;
    struct timeval realtime2;
    NXPing();
    gettimeofday(&realtime1,&tzone1);
    NXPing();
    gettimeofday(&realtime2,&tzone1);
    tare = (-realtime1.tv_sec + realtime2.tv_sec)+ 
            (-realtime1.tv_usec+realtime2.tv_usec)/1000000.0;
    return self;
}

-psEnter
{
    cumTimesEntered++;
    PSusertime(&stime);
    getrusage(RUSAGE_SELF,&rtime);
    synctime = (rtime.ru_utime.tv_sec + rtime.ru_stime.tv_sec) +
                (rtime.ru_utime.tv_usec + rtime.ru_stime.tv_usec)/1000000.0;
    return self;
}

-wallLeave
{
    double eTime;
    NXPing();
    gettimeofday(&realtime,&tzone);
    eTime = (- synctime + realtime.tv_sec + realtime.tv_usec/1000000.0) 
                -tare;
    cumWallTime += eTime;
    return self;
}

-psLeave
{
    int et;
    double appTime;
    double psTime;
    getrusage(RUSAGE_SELF,&rtime);
    PSusertime(&et);
    psTime = ((et-stime)/1000.0);
    cumPSTime += psTime;
    appTime  = ((rtime.ru_utime.tv_sec + rtime.ru_stime.tv_sec) +
                (rtime.ru_utime.tv_usec + 
                rtime.ru_stime.tv_usec)/1000000.0) -synctime;
    cumAppTime += appTime;
    return self;
}

-leave
{
    if(wallTime)
    [self wallLeave];
    else
    [self psLeave];
    return self;
}

-reset
{
    cumAppTime = 0.0;
    cumPSTime = 0.0;
    cumWallTime = 0.0;
    cumTimesEntered = 0;
    return self;
}

-avgElapsedTime
{
    if(wallTime)
        avgWallTime = (cumWallTime/(double)cumTimesEntered);
    else{
        avgAppTime = (cumAppTime/(double)cumTimesEntered) ;
        avgPSTime = (cumPSTime/(double)cumTimesEntered);
    }
    return self;
}

-(double) cumWallTime
{
    if(wallTime ==WALLTIME)
    return cumWallTime;
    else
    return -1.0;
}

-(double) cumAppTime;
{
    if(wallTime ==PSTIME)
    return cumAppTime;
    else
    return -1.0;
}

-(double) cumPSTime;
{
    if(wallTime ==PSTIME)
    return cumPSTime;
    else
    return -1.0;
}

-summary:(NSOutputStream *)c
{
    if(wallTime) {
	NSString *msg = [NSString stringWithFormat:
	    @"Timer %d : entered %d trials TotalWall Time  %lf \n",
            tag, cumTimesEntered, cumWallTime];
	[c write:[msg UTF8String] maxLength:[msg length]];
	[msg release];
    }
    else {
        NSString *msg = [NSString stringWithFormat:
	    @"Timer %d : %d trials App: %lf  Server: %lf  "
	    @"Percent Server: %lf Total: %lf\n\00",
            tag,cumTimesEntered,cumAppTime,cumPSTime,
            cumPSTime/(cumAppTime+cumPSTime),
            cumAppTime+cumPSTime];
	[c write:[msg UTF8String] maxLength:[msg length]];
	[msg release];
    }
    NXFlush(c);
    return self;
}

@end


#endif
