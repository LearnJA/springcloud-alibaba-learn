package com.module.code.enums;

/**
 * 公共枚举
 */
public enum CommonEnum {

    /**
     * <pre>
     * codeType : ADDR_ISDEFAULT
     * codeName : 默认地址
     * code : 1
     * value : 否
     * </pre>
     */
    ADDR_ISDEFAULT_1("ADDR_ISDEFAULT", "默认地址", "1", "否"),
    /**
     * <pre>
     * codeType : ADDR_ISDEFAULT
     * codeName : 默认地址
     * code : 0
     * value : 是
     * </pre>
     */
    ADDR_ISDEFAULT_0("ADDR_ISDEFAULT", "默认地址", "0", "是");

    private String codeType;
    private String codeName;
    private String code;
    private String value;

    private CommonEnum(String codeType, String codeName, String code, String value) {
        this.codeType = codeType;
        this.codeName = codeName;
        this.code = code;
        this.value = value;
    }

    public String getCodeType() {
        return codeType;
    }

    public void setCodeType(String codeType) {
        this.codeType = codeType;
    }

    public String getCodeName() {
        return codeName;
    }

    public void setCodeName(String codeName) {
        this.codeName = codeName;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
