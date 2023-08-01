package dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import dto.MemberDTO;

public class MyJob implements Job {

	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		int count = 0;
		try {
			MemberDAO mdao = new MemberDAO();
			ArrayList<MemberDTO> mdto = mdao.getMember();
			count = mdao.Count();
			for(int i=0; i<mdto.size(); i++) {
				String id = mdto.get(i).getId();
				int mypoint = mdto.get(i).getPoint();
				mdao.getPoint(mypoint, id);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
		Date date = new Date(System.currentTimeMillis());
		
		System.out.println("JOB이 실행됨 : "+formatter.format(date)+" / "+count+"명에게 포인트 부여(1점).");
	}
}





