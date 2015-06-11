package it.research;

import it.util.ConnUtil;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.data.general.DefaultPieDataset;

@WebServlet("/research/chart.it")
public class ChartView extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 차트를 만들어서 쏘는 서블릿
		
		// 1. 차트를 만드는데 필요한 데이터를 세팅
		DefaultPieDataset ds = new DefaultPieDataset();
		
		// 2. 데이터를 세팅시키기 위해서 DB 와 연동
		try {
			Connection conn = ConnUtil.open();
			String sql ="select * from research where num=1";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				ds.setValue("1.", rs.getInt("ans1") );
				ds.setValue("2. ", rs.getInt("ans2") );
				ds.setValue("3. ", rs.getInt("ans3") );
				ds.setValue("4. ", rs.getInt("ans4") );
			}
			rs.close();
			ps.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		// 3. 차트 생성
		JFreeChart ch = ChartFactory.createPieChart("research RESULT", ds);
		
		// 4. 전송하기 위한 출력 통로  확보
		OutputStream os = response.getOutputStream();
		
		// 5. 실제 전송
		ChartUtilities.writeChartAsPNG(os, ch, 450, 450);
		os.close();
		
		
	}
}





