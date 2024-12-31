/**
 * 
 */
package com.erp.common.database;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Description : 클래스에 대한 설명을 입력해주세요.<br>
 * Date : 2024. 12. 30.<br>
 * History :<br>
 * - 작성자 : Kosta, 날짜 : 2024. 12. 30., 설명 : 최초작성<br>
 *
 * @author Kosta
 * @version 1.0
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PreparedStatementVO {
	private String sql;
	private Object[] attribute;
}
