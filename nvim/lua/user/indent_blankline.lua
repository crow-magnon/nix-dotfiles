local cmp_status_ok, indent_blankline = pcall(require, 'indent_blankline')
if not cmp_status_ok then
    return
end

indent_blankline.setup {
    show_end_of_line = true,
}
