package cn.yellowgg.utils;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;

/**
 * @Description:
 * @Author: yellowgg
 * @Date: Created in 2020/2/17 20:39
 */
public class FileUtils {

    // TODO 不用webapp/imges下的了 直接用虚拟目录里面的，所以发布的时候记得先在虚拟目录放好两张图
    private static String HEADVIRTUALDIRECTORY = "/opt/tomcat9/loveDiaryHeadImg/";

    /**
     * 替换头像专用
     * 在虚拟目录中先删除再存储，达到替换的目的
     */
    public static void saveHeadPicFile(MultipartFile file, String fileName) throws Exception {
        mkdir(new File(HEADVIRTUALDIRECTORY));
        delete(new File(HEADVIRTUALDIRECTORY + fileName));
        file.transferTo(new File(HEADVIRTUALDIRECTORY + fileName));
    }

    public static void mkdir(File dir) {
        if (dir.isDirectory() && !dir.exists()) {
            dir.mkdir();
        }
    }

    public static void delete(File file) {
        if (file.exists()) {
            file.delete();
        }
    }
}
