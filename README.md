### **Head Tags with Customizable Features**

This script adds head tags above players in your FiveM server, displaying their role and the server name in a visually appealing and customizable format. It's perfect for roleplay and other servers to identify roles like Admin, Staff, or specialized roles like LSPD and EMS.

---

### **Features**
1. **Customizable Text**:
   - Display server name and role (e.g., `KRP - Admin`).
   - Easily change the format, size, and colors to match your server's style.

2. **Role-Specific Colors**:
   - Assign unique colors to each role for better differentiation.
   - Modify the RGBA color values for complete customization.

3. **Dynamic Updates**:
   - Automatically updates head tags when roles are changed using `/setrole`.

4. **Text Centering**:
   - Ensures the text is perfectly aligned above the player.

5. **Adjustable Text Size**:
   - Modify `SetTextScale` to make text larger or smaller as needed.

6. **Wide Range of Roles**:
   - Includes predefined roles like Owner, Admin, LSPD, EMS, and custom roles like Head of LSPD or Los Zetas Cartel.
   - Add or remove roles easily in the configuration.

7. **Outline Support**:
   - Adds an outline to the text, making it visible against any background.

8. **Simple Setup**:
   - Plug-and-play script that works seamlessly with commands to assign roles instantly.

---

### **How to Add More Roles**
1. Open the script and find the `roleTags` table.
2. Add a new line like this:
   ```lua
   ["new_role_key"] = {text = "Display Name", color = {R, G, B, A}},
   ```
   Replace `new_role_key` with your role's identifier and `Display Name` with the name to display above the player.

3. Example:
   ```lua
   ["swat"] = {text = "SWAT", color = {50, 205, 50, 215}}, -- Lime Green
   ```

4. Save the script and restart the server.

---

### **Commands**
- `/setrole <playerId> <role>`:
  Assign a role to a player. The head tag updates in real time.

---

### **Usage Examples**
- **Assigning Admin**:
  ```plaintext
  /setrole 1 admin
  ```
  Displays `KRP - Admin` in orange above the player.

- **Assigning LSPD**:
  ```plaintext
  /setrole 2 lspd
  ```
  Displays `KRP - LSPD` in dark blue above the player.

---

This script provides a clean, efficient, and highly customizable solution for managing head tags in your FiveM server. Let me know if you'd like additional customization or setup assistance!
