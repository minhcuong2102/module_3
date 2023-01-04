package model.employee.user_role;

public class UserRole {
    private Role roleId;
    private User username;

    public UserRole() {
    }

    public UserRole(Role roleId, User username) {
        this.roleId = roleId;
        this.username = username;
    }

    public Role getRoleId() {
        return roleId;
    }

    public void setRoleId(Role roleId) {
        this.roleId = roleId;
    }

    public User getUsername() {
        return username;
    }

    public void setUsername(User username) {
        this.username = username;
    }
}
