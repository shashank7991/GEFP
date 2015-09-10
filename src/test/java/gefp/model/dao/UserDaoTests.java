package gefp.model.dao;

import gefp.model.dao.UserDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTransactionalTestNGSpringContextTests;
import org.testng.annotations.Test;

@Test(groups = "UserDaoTests")
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class UserDaoTests extends AbstractTransactionalTestNGSpringContextTests {

   /* @Autowired
    UserDao userDao;

    @Test
    public void getUser()
    {
        assert userDao.getUser( 1 ).getUsername().equalsIgnoreCase( "admin" );
    }

    @Test
    public void getUsers()
    {
        assert userDao.getUsers().size() > 0;
    }*/

}
