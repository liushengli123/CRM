import com.gxa.mapper.AdminMapper;
import com.gxa.mapper.CourseMapper;
import com.gxa.mapper.MarketPlanMapper;
import com.gxa.pojo.Admin;
import com.gxa.pojo.Course;
import com.gxa.pojo.Marketplan;
import com.gxa.pojo.param.CourseParam;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.sql.Timestamp;
import java.util.List;

/**
 * @author:IT-CNLM
 * @date:Created at 2020/08/12
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-dao-config.xml")
public class MybatisTest {


    @Autowired
    private AdminMapper adminMapper;
    @Autowired
    private CourseMapper courseMapper;
    @Autowired
    private MarketPlanMapper marketPlanMapper;

    @Test
    public void test01(){
        List<Admin> all = adminMapper.findAll();
        System.out.println(all);
    }

    @Test
    public void test02(){
        Admin admin=new Admin();
        admin.setName("admin");
        admin.setUpdateTime(new Timestamp(System.currentTimeMillis()));
        admin.setId(1L);
        adminMapper.update(admin);
    }

    @Test
    public void test03(){
        String[] ids={"3","4"};
        courseMapper.deletedByIds(ids);
    }

    @Test
    public void test04(){
        CourseParam courseParam =new CourseParam();
        courseParam.setKeywords("t");
        courseParam.setEnd("2020-08-01 00:00:00");
       List<Course> all = courseMapper.findAll(courseParam);
       System.out.println(all);
    }

    @Test
    public void test05(){
        List<Marketplan> all = marketPlanMapper.findAll();
        for (Marketplan marketplan:all){
            System.out.println(marketplan);
            System.out.println(marketplan.getCourse());
            System.out.println(marketplan.getTeacher());
            System.out.println(marketplan.getClassRoom());
        }
    }
}
