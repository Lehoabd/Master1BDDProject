export function isNull(content: any): boolean{
    return content === undefined || content == null || content === '';
}

export function isNotNull(content: any): boolean{
    return content !== undefined && content != null && content !== '';
}