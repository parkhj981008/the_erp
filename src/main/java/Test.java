import java.net.URLDecoder;

import com.erp.auth.vo.AuthDTOs.LoginResponseDTO;
import com.erp.common.util.AES256Util;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 
 */

/**
 * Description : 클래스에 대한 설명을 입력해주세요.<br>
 * Date : 2024. 12. 27.<br>
 * History :<br>
 * - 작성자 : Kosta, 날짜 : 2024. 12. 27., 설명 : 최초작성<br>
 *
 * @author Kosta
 * @version 1.0
 */
public class Test {
	static ObjectMapper om = new ObjectMapper();
	public static void main(String[] args) throws Exception {
		String cook = "rByZ88Yf0d2NiJpfSss5%2B49J5z0CMcA9gj%2BSP%2Bt8DyE%3D";
		LoginResponseDTO dto = om.reader().readValue(AES256Util.decrypt(URLDecoder.decode(cook)), LoginResponseDTO.class);
		System.out.println(dto.getRoles()[0]);
	}
}

