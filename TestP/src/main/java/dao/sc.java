package dao;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.SimpleScheduleBuilder;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

public class sc {
	public static void start() throws SchedulerException {
		System.out.println("<<< 포인트 스케줄러가 시작되었습니다. >>>");
		SchedulerFactory sf = new StdSchedulerFactory();
		Scheduler sched = sf.getScheduler();
		JobDetail job = JobBuilder.newJob(MyJob.class)
									.withIdentity("myjob", "group1")
									.build();
		Trigger trigger = TriggerBuilder.newTrigger()
									.withIdentity("myTrigger", "group1")
									.startNow()
									.withSchedule(SimpleScheduleBuilder.simpleSchedule()
												.withIntervalInSeconds(20)
												.repeatForever())
									.build();
		sched.scheduleJob(job, trigger);
		sched.start();
	}
	
	public static void stop() throws SchedulerException {
		SchedulerFactory sf = new StdSchedulerFactory();
		Scheduler sched = sf.getScheduler();
		sched.shutdown();
		System.out.println("<<< 포인트 스케줄러의 실행이 종료되었습니다. >>>");
	}
}



