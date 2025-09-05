package pkg

import (
	"fmt"
	"runtime"
)

func WrapError(err error) error {
	if err == nil {
		return nil
	}
	_, file, line, _ := runtime.Caller(1)
	return fmt.Errorf("%s:%d %w", file, line, err)
}
