import com.alibaba.excel.EasyExcel;
import com.gxa.excel.AdminListener;
import com.gxa.pojo.Admin;
import com.gxa.util.TestFileUtil;
import org.junit.Test;

import java.io.File;

/**
 * @author:IT-CNLM
 * @date:Created at 2020/08/14
 */

public class ExcelTest {


    @Test
    public void test01(){
        String fileName = TestFileUtil.getPath() + File.separator + "test.xlsx";
        System.out.println(fileName);
        EasyExcel.read(fileName, Admin.class, new AdminListener()).sheet().doRead();
    }

}
