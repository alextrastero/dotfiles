local status_ok, copilot = pcall(require, 'copilot-cmp')
if not status_ok then
  return
end

copilot.setup();
