local status, comment = pcall(require, "Comment")

if not status then
  print("comment could not be set up")
  return
end

comment.setup()
