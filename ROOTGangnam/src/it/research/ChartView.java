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
		// ��Ʈ�� ���� ��� ����
		
		// 1. ��Ʈ�� ����µ� �ʿ��� �����͸� ����
		DefaultPieDataset ds = new DefaultPieDataset();
		
		// 2. �����͸� ���ý�Ű�� ���ؼ� DB �� ����
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
		// 3. ��Ʈ ����
		JFreeChart ch = ChartFactory.createPieChart("research RESULT", ds);
		
		// 4. �����ϱ� ���� ��� ���  Ȯ��
		OutputStream os = response.getOutputStream();
		
		// 5. ���� ����
		ChartUtilities.writeChartAsPNG(os, ch, 450, 450);
		os.close();
		
		
	}
}





