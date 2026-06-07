package daelim.book.rental.user.account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.lang.Nullable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Component
public class UserAccountDao {

    private JdbcTemplate jdbcTemplate;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    public UserAccountDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public int insertUser(UserAccountVo userAccountVo) {
        String sql = "INSERT INTO TB_USER_MEMBER (id, pw, name, gender, email, phone, regDate, modDate) " +
                     "VALUES (?, ?, ?, ?, ?, ?, NOW(), NOW())";
        try {
            return jdbcTemplate.update(sql,
                    userAccountVo.getId(),
                    bCryptPasswordEncoder.encode(userAccountVo.getPw()),
                    userAccountVo.getName(),
                    userAccountVo.getGender(),
                    userAccountVo.getEmail(),
                    userAccountVo.getPhone());
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public boolean existUser(String id) {
        String sql = "SELECT COUNT(*) FROM TB_USER_MEMBER WHERE id = ?";
        int result = jdbcTemplate.queryForObject(sql, Integer.class, id);
        return result > 0;
    }

    public int updateUser(UserAccountVo userAccountVo) {
        String sql = "UPDATE TB_USER_MEMBER SET name=?, gender=?, email=?, phone=?, modDate=NOW() WHERE id=?";
        try {
            return jdbcTemplate.update(sql,
                    userAccountVo.getName(),
                    userAccountVo.getGender(),
                    userAccountVo.getEmail(),
                    userAccountVo.getPhone(),
                    userAccountVo.getId());
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public UserAccountVo selectUser(UserAccountVo userAccountVo) {
        String sql = "SELECT * FROM TB_USER_MEMBER WHERE id = ?";
        List<UserAccountVo> list = new ArrayList<>();
        try {
            list = jdbcTemplate.query(sql, new RowMapper<UserAccountVo>() {
                @Nullable
                @Override
                public UserAccountVo mapRow(ResultSet rs, int rowNum) throws SQLException {
                    UserAccountVo vo = new UserAccountVo();
                    vo.setId(rs.getString("id"));
                    vo.setPw(rs.getString("pw"));
                    vo.setName(rs.getString("name"));
                    vo.setGender(rs.getString("gender"));
                    vo.setEmail(rs.getString("email"));
                    vo.setPhone(rs.getString("phone"));
                    return vo;
                }
            }, userAccountVo.getId());

            if (!list.isEmpty()) {
                if (!bCryptPasswordEncoder.matches(userAccountVo.getPw(), list.get(0).getPw())) {
                    list.clear();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list.isEmpty() ? null : list.get(0);
    }
}
